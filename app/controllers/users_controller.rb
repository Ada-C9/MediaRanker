class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

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

  def show
  end

  def edit
  end

  def update
    user.assign_attributes(user_params)

    if user.save
      redirect_to user_path(user)
    end
  end

  def destroy

  end

  private

  def user_params
    return params.require(:user).permit(:user_name)
  end

  def find_user
    user = params[:id]
    @user = User.find(user)

  end


end
