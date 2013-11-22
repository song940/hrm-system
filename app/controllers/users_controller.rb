class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:show, :edit, :update, :destroy]



  # GET /users/1
  # GET /users/1.json
  def show
  end

  def msg
    @msgs = Msg.where(:receiver => @user)
  end

  # GET /users/new
  def new
    back_to_user
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    user = User.find_by(:email => user_params[:email])
    if user.nil?
      user = User.new(user_params) 
      user.token = "12345" 
      user.save(:validate => false)
      flash[:success] = user.token
      redirect_to user_verify_url(user.email)
    else
      flash[:warning] = "您已经注册了 ."
      redirect_to sign_in_url(user)
    end
  end

  def verify
    params
  end

  def active
    @user = User.find_by(:token => params[:code])
    if @user
      flash[:success] = "激活成功 , 请设置用户信息"
      sign_in @user
      redirect_to user_setting_url(@user)
    else
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to user_home_path @user.username }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #Mailer.welcome(@user.email).deliver
    flash[:info] = I18n.t("comm.come_back")  if @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(:username => params[:username])
      render "/errors/404", :status => 404 unless @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password,:name)
    end

end
