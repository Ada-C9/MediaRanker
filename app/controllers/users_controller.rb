class UsersController < ApplicationController
  before_action :require_login

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def find_user
    @current_user = User.find(session[:user_id])
  end

end
