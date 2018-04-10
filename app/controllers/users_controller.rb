class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @users = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
    flash[:success] = "#{ user.name } is successfully logged in."
      redirect_to root_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new
    end
  end

  def destroy
    user.delete(:user_id)
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end

  private
  def user_params
    return params.require(:user).permit(:name)
  end


end
