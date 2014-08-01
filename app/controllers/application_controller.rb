class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  
  helper_method :current_user, :require_login
  
 
  private
 
  def require_login
    unless current_user
      flash[:warning] = "You are not currently logged in"
      redirect_to log_in_path
    end
  end

  def current_user
    @current_user ||= User.includes(:organisation).find(session[:user_id]) if session[:user_id]
  end
end
