class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def find_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in
    unless find_user
      flash[:alert] = ["You must be logged in to do that"]
      redirect_to login_form_path
    end
  end

end
