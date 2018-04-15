class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show ; end

  def edit ; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private
  def user_params
    return params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
