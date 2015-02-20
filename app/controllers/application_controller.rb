class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user = Staff.find_by_id(session[:staff_id]) ||
                  Voter.find_by_id(session[:voter_id])
  end



  def logged_in?
    if current_user.nil?
      redirect_to log_in_path,
      notice: "Please log in to create a survey"
    end
  end
end
