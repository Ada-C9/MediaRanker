class UsersController < ApplicationController

  # before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  # def update
  #   @user.user(user_params)
  #   flash[:success] = "#{@user.username} updated"
  #   redirect_to user_path(params[:id])
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id != nil
      flash[:success] = "Successfully created new user #{@user.username} with ID #{@user.id}"
      redirect_to users_path
    else
      flash.now[:alert] = @user.errors
      render :new
    end
  end

  def destroy

  end

  private
  def user_params
    return params.require(:user).permit(:username, :id, :created_at)
  end
end
