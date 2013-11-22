class Admin::ChecksController < Admin::ApplicationController

  def index
    @check = { 
      :check_in => Admin::Setting.get('check','check_in'),
      :check_out=> Admin::Setting.get('check','check_out'),
      :limit => Admin::Setting.get('check','limit')
    }
  end

  def mark
    result = false
    if params[:flag] == 'true'
      date = params[:date].to_date
      @check = Admin::Check.new
      @check[:date] = date
      @check[:year] = date.year
      @check[:month] = date.month
      result = @check.save
    else
      @check = Admin::Check.find_by(:date => params[:date].to_date)
      result = @check.destroy
    end
    render :json => { :ok => result }
  end

  def list
    render json: Admin::Check.where(:year => params[:year], :month => params[:month]).map{ |k| k.date.day }.to_json
  end

  def setting
    Admin::Setting.set('check','check_in',params[:check_in])
    Admin::Setting.set('check','check_out',params[:check_out])
    Admin::Setting.set('check','limit',params[:limit])
    render :json => {}
  end
end
