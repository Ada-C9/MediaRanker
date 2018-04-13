class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :get_model

  private
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def get_model
    return @user if @user
    return @vote if @vote
    return @work if @work
  else

  end
end
