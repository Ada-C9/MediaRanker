class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new

  end

  def create
    @users = User.new(user_params)

    if @user.save
      flash[:success]= "#{user.name} is successfully logged in."
      redirect_to root_path
    else
      flash[:failure] = "Validations failed"
      render :new
  end

  def destroy
    @user.delete(:user_id)
    flash.now[:success] "logged out successfully "
    redirect_to root_path
  end


end
