class UsersController < ApplicationController
  def index
    @users = User.all.order(params[:id])
  end

  def show
    @user = User.all.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :join_date)
  end

end
