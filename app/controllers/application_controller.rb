class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    unless !current_user.nil?
      flash[:danger] = "Please Log in"
      redirect_to new_user_session_path
    end
  end
end
