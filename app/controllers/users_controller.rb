class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)

    if user.save
      redirect_to user_path(user.id)
    end
  end

  def destroy
    @user.delete(:user_id)
    flash.now[:success] "logged out successfully "
    redirect_to root_path
  end

private

def user_params
    return params.require(:user).permit(:user_name)
  end


end
