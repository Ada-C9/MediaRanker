class SessionsController < ApplicationController


  def create
    @user = User.find_by(username: params[:user][:username])

    if @user
      session[:user_id] = @user.id

      flash[:success] = "Welcome back #{@user.username}"
      redirect_to root_path
    else
      @user = User.create(username: params[:user][:username],date_joined: Date.today)
      if session[:user_id] = @user.id
        flash[:success] = "Successfully logged in as #{@user.username}"
        redirect_to root_path
      else
        flash.now[:error] = "You are not logged in. Please login"
        render :new
      end
    end
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
