class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      log_user_in(@user)
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

  def destroy
    log_user_out
    redirect_to root_path
  end
end