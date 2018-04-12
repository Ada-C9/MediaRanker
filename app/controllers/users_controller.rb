class UsersController < ApplicationController
  before_action :find_user
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
