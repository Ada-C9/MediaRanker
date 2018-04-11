class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find_by(id)
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new
  end

  def create
  end

  def destroy

  end

  private
  def user_params
    return params.require(:user).permit(:username, :id)
  end
end
