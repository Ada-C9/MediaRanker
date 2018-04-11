class UsersController < ApplicationController
  def index
    @users = user.all
  end

  def show
    id = params[:id]
    @user = user.find_by(id)
  end

  def edit
  end

  def update
  end

  def new
    @user = user.new
  end

  def create
  end

  def destroy

  end

# do i need this?
  # private
  # def user_params
  #   return params.require(:user).permit(:username, :id)
  # end
end
