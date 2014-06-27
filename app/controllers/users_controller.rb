class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name],
                     email: params[:user][:email],
                     password: params[:user][:password]
    )

    if @user.save
      log_user_in(@user)
      redirect_to users_path
    else
      render new_user_path
    end
  end
end