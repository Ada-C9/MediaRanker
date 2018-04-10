class UsersController < ApplicationController
  def index
    @users = Users.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
    @votes = @user.vote.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name) 
end
