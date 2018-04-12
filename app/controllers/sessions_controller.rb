class SessionsController < ApplicationController


  def create
    @user = User.find_by(username: params[:user][:username])

    if @user
      session[:user_id] = @user.id

      flash[:success] = "Welcome back #{@user.username}"
    else
      @user = User.create(username: params[:user][:username])
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
    end
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end
end
