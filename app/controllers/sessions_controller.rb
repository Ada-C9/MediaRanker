class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by user_name: params[:user][:user_name]

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.user_name}"
    else
      @user = User.create user_name: params[:user][:user_name]
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.user_name}"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end
end
