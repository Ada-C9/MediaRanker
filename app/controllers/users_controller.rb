class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect to users_path
    end
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    @votes = Vote.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end
end
