class UsersController < ApplicationController

  def index
    @users = user.all
  end

  def new
    @user = user.new
  end

  def create
    user = user.new(user_params)
  end

  def show
    user_id = params[:id]

    @user = user.find(user_id)
  end

  def edit
    @user = user.find(params[:id])
  end

  def update
    user = user.find(params[:id])

    user.assign_attributes(user_params)

    if user.save
      redirect_to user_path(user)
    end
  end

  def destroy
    @user = user.find(params[:id])

    redirect_to users_path
  end

  private
  def user_params
    return params.require(:user).permit(:name)
  end
end
