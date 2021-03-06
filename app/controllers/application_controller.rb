class ApplicationController < ActionController::Base
  before_filter :set_request_environment

  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    if current_user.nil?
      flash[:alert] = 'You are not allowed here without login in'
      redirect_to login_url
    end
  end

  def set_request_environment
    User.current = current_user
  end
end
