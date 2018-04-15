class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end


  private
  def user_params
    return params.require(:user).permit(:name)
  end

end
