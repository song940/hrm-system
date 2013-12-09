class ChecksController < ApplicationController

  # GET /checks
  # GET /checks.json
  def index
    defaults = { 
      :year       => DateTime.now.year,
      :month      => DateTime.now.month,
      :employee   => 0
     }
    @results = []
    
    params.replace(defaults.merge(params))
    year, month,employee_id = params[:year].to_i, params[:month].to_i,params[:employee].to_i
    date = Date.new year, month, 1 #
    # check data
    check_begin = Check.select(:chk).where(:year => year,:month => month).order(:chk).first
    check_end   = Check.select(:chk).where(:year => year,:month => month).order(:chk).last
    return if check_begin.nil? || check_end.nil? # no data
    if check_begin.chk.day > date.at_beginning_of_month.day  || check_end.chk.day < date.at_end_of_month.day
      @require_import = { :begin  => check_begin.chk, :end    => check_end.chk } 
    end
    days = (date.at_beginning_of_month .. date.at_end_of_month).to_a
    idle_days = Admin::Check.where(:year => year,:month => month).map{|m|m.date}
    work_days = days - idle_days

    logger.info "===>工作:#{work_days}"

    if employee_id.zero? # all
      employee_ids = Employee.select(:id).map{|emp|emp.id}
    else
      employee_ids = Employee.select(:id).where(:id => employee_id).map{|emp|emp.id }
    end

    logger.info "===>员工:#{employee_ids}"

    employee_ids.each do |employee_id|
      checks = Check.where(:employee_id => employee_id,:year => year,:month => month).map{ |m| m.chk }
      chk_days = checks.map{ |m| m.to_date }.uniq
      no_work = work_days - chk_days
      overflow_work = chk_days - work_days
      logger.info "===>签到:#{chk_days}"
      logger.info "===>缺勤:#{no_work}"
      logger.info "===>加班:#{overflow_work}"

      no_work.each do |day|
        @results << { :employee_id => employee_id, :date => day.to_datetime, :mode => 4 }
      end

      overflow_work.each do |day|
        @results << { :employee_id => employee_id, :date => day.to_datetime, :mode => 3 }
      end

      chk_time = {  }
      checks.each do |chk|
        chk_time[chk.day] ||= []
        chk_time[chk.day] << chk
      end

      check_in  = Admin::Setting.get('check','check_in')
      check_out = Admin::Setting.get('check','check_out')
      limit     = Admin::Setting.get('check','limit')
      limit_seconds = limit.to_i * 60

      chk_time.each do |(day,chks)|
        iso_check_in_time = Time.parse("#{year}-#{month}-#{day} #{check_in} UTC +0000")
        iso_check_out_time = Time.parse("#{year}-#{month}-#{day} #{check_out} UTC +0000")
        check_in_time = chks.first
        check_out_time = chks.last
        too_late  = (check_in_time  - iso_check_in_time  ) > limit_seconds
        too_early = (iso_check_out_time - check_out_time ) > limit_seconds
        @results << { :employee_id => employee_id, :date => check_in_time.to_datetime, :mode => 1 }  if too_late
        @results << { :employee_id => employee_id, :date => check_out_time.to_datetime, :mode => 2 } if too_early
      end
    end
    @results.delete_if do |x| 
      CheckException.where(
        :employee_id => x[:employee_id],
        :date => Time.zone.parse(x[:date].to_s),
        :mode => x[:mode]
      ).size > 0 
    end
    @results.sort!{ |x,y| x[:date] <=> y[:date] }
  end

  def import
    uploaded_io = params[:file]
    if uploaded_io.nil?
      flash[:error] = "导入失败" 
      redirect_to checks_url
      return
    end
    file_content = uploaded_io.read
    index = 0
    counter = 0
    file_content.each_line do |line|
      index+=1
      next if index == 1
      data = line.force_encoding("iso-8859-1").split(/\t+/)
      break if data.size < 7  #hardcode to seven .
      m_NO,m_TMNo,m_EnNo,m_Name,m_GMNo,m_Mode,m_DateTime = data.map{ |k| k.gsub!(/\u0000/,'') }
      m_NO,m_TMNo,m_EnNo,m_Name,m_GMNo,m_Mode,m_DateTime = m_NO.to_i,
                                                           m_TMNo.to_i,
                                                           m_EnNo.to_i,
                                                           m_Name.to_s,
                                                           m_GMNo.to_i,
                                                           m_Mode.to_i,
                                                           Time.zone.parse(m_DateTime)

      hash = { 
        :employee_id  =>  m_EnNo,
        :year         =>  m_DateTime.year,
        :month        =>  m_DateTime.month,
        :chk          =>  m_DateTime
      }

      if Check.where(hash).count.zero?
        Check.create(hash)
        counter+=1
      end
      
    end

    flash[:success] = "成功导入 #{counter} 条  "
    redirect_to checks_url
  end

  def exception
    exp = CheckException.new do |exp|
      exp[:employee_id] = params[:emp]
      exp[:date] = params[:date]
      exp[:mode] = params[:type]
    end
    render json: exp if exp.save
  end

end
