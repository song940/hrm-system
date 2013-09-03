class SessionsController < ApplicationController

  def new
    redirect_to current_user if signed_in?
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
       sign_in user
       #redirect_to user
       redirect_back_or "/#{user.username}"
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = "Bye !"
    redirect_to root_path
  end


end
