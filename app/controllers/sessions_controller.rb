class SessionsController < ApplicationController

  #
  #new sessions
  #
  def new
    redirect_to current_user if signed_in?
  end

  #
  #post data
  #
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
       sign_in user
       #redirect_to user
       redirect_back_or "/#{user.username}"
    else
      flash[:error] = I18n.t("user.invalid") # Not quite right!
      render 'new'
    end
  end

  #
  #delete sessions
  #
  def destroy
    sign_out
    flash[:success] = "Bye !"
    redirect_to root_path
  end


end
