class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new(id: params[:id])

  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
      #work.create
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    user.assign_attributes(user_params)

    if user.save
      redirect_to user_path(user)
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      redirect_to users_path
      #if delete works.delete
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :joined)
  end
end
