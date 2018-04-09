class UserController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  end


  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

end
