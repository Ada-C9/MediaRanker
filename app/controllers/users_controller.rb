class UsersController < ApplicationController
  def index
    @users = User.all
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

  def show
    user_id = params[:id]
    @user = User.find(user_id)
  end

  def update
    @user = User.find(params[:id])
    @user.assign_atrributes(user_params)
    if @user.save
      #  ?
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user.permit(:name))
  end
end
