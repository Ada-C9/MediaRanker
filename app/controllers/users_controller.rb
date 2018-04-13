class UsersController < ApplicationController
  def edit
  end

  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def destroy
  end

  def update
  end
end
