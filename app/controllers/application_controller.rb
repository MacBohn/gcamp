class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  def ensure_logged_in
    if session[:user_id].nil?
      redirect_to signin_path, notice: "You must be logged in to access that action"
    end

  end
  
  def current_user
    User.find_by_id(session[:user_id])
  end

  def determine_layout
    current_user ? "application" : "public"
  end

  helper_method :current_user
  protect_from_forgery with: :exception
end
