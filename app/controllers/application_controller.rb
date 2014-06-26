class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_user_in(user)
    session[:id] = user.id
  end

  def log_user_out
    session[:id] = nil
  end

  helper_method :current_user

  def current_user
    if session[:id]
      User.find(session[:id])
    end
  end
end
