class UsersController < ApplicationController
  include GetUsername
  before_action :get_username

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if session[:user_id]
      user = User.find(session[:user_id])
      @recommended = User.recommendations(user).first
    end
  end

end
