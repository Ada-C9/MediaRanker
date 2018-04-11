class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  # I don't update the user info
  # I only update their voting history, this can be tracked from vote model.
  def update
    # @user.user(user_params)
    # flash[:success] = "#{@user.username} updated"
    # redirect_to user_path(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id != nil
      flash[:success] = "Successfully created new user #{@user.username} with ID #{@user.id}"
      redirect_to users_path
    else
      # where have I defined the user.errors??
      flash.now[:alert] = @user.errors
      render :new
    end
  end

  def destroy

  end

  private
  def user_params
    # I only want it to return the date not full timestamps...do this in view?

    return params.require(:user).permit(:username, :id, :created_at)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
