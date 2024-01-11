class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      @current_user = user if user.is_a?(User)
    end

    @current_user
  end
  helper_method :current_user

  private

  def require_login
    unless current_user.present?
      flash[:alert] = "You must be logged in to access this page."
      redirect_to login_path # Adjust the redirect path as needed
    end
  end
end
