class Admin::ChecksController < Admin::ApplicationController
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
end
