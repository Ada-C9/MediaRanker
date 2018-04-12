class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if !@user.nil?
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.username}"
      redirect_to root_path
    else
      @user = User.create(username: params[:user][:username])

      if @user.errors.keys.length > 0
        flash[:alert] = @user.errors
      else
        session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.username}"
      end
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out"
    redirect_to root_path
  end
end
