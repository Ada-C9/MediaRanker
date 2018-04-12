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
      flash[:success] = 'User dded successfully'
      redirect_to root_path
    else
      flash.now[:failure] = 'Validations Failed'
      render :new
    end
  end

  def show
    user_id = params[:id]

    @user = User.find(user_id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.assign_attributes(user_params)

    if @user.save
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def destroy
   User.destroy(params[:id])

    redirect_to users_path
  end

  private

  def user_params
    return params.require(:user).permit(:name, :created_at)
  end
end
