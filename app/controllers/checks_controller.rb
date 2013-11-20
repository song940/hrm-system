class ChecksController < ApplicationController
  before_action :set_check, only: [ :edit, :update, :destroy]

  # GET /checks
  # GET /checks.json
  def index
    @checks = Check.all
  end

  # GET /checks/1
  # GET /checks/1.json
  def show
  end

  # GET /checks/new
  def new
    @check = Check.new
  end

  # GET /checks/1/edit
  def edit
  end

  # POST /checks
  # POST /checks.json
  def create
    @check = Check.new(check_params)

    respond_to do |format|
      if @check.save
        format.html { redirect_to @check, notice: 'Check was successfully created.' }
        format.json { render action: 'show', status: :created, location: @check }
      else
        format.html { render action: 'new' }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checks/1
  # PATCH/PUT /checks/1.json
  def update
    respond_to do |format|
      if @check.update(check_params)
        format.html { redirect_to @check, notice: 'Check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checks/1
  # DELETE /checks/1.json
  def destroy
    @check.destroy
    respond_to do |format|
      format.html { redirect_to checks_url }
      format.json { head :no_content }
    end
  end

  def import
    uploaded_io = params[:file]
    file_content = uploaded_io.read
    index = -1
    file_content.each_line do |line|
      index+=1
      next if index == 0
      data = line.force_encoding("iso-8859-1").split(/\t/)
      m_NO,m_TMNo,m_EnNo,m_Name,m_GMNo,m_Mode,m_DateTime = data
      logger.debug "#{m_NO}\t#{m_EnNo}\t#{m_DateTime}"
    end
    flash[:success] = "成功导入 #{index} 条"
    redirect_to checks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @check = Check.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_params
      params.require(:check).permit(:employee_id, :check_in, :check_out)
    end
end
