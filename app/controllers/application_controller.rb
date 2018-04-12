class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_user

  def find_user
    @user = User.find_by(id: session[:user_id])
    # @user = User.find_by name: params[:user][:name]
  end
end
