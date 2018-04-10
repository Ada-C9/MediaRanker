class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def vote
  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end
end
