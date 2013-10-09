class Admin::UsersController < Admin::ApplicationController
    # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def edit
  	
  end

  def destroy
  	flash[:success] = "OK"
  	redirect_to admin_users_url
  end
end
