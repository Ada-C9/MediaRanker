class UsersController < ApplicationController
  include GetUsername
  before_action :get_username

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
