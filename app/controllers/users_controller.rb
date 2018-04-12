class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # POST method
    user = User.new(name: params[:name])
  end

  def index
    @users = User.all
  end
end
