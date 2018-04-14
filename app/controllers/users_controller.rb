class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new

  end

  def create

  end

  def show
    @user = User.find_by(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
