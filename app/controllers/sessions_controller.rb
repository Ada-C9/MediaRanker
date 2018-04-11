class SessionsController < ApplicationController
  def new
    @user = User.new
    @user.joined = Date.today
  end

  def login
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name } is successfully logged in"
      redirect_to user_path(user)
    else
      @user = User.create(name: params[:user][:name])
      session[:user_id] = @user.id
      flash[:success] = "#{ @user.name } is successfully logged in"
      redirect_to user_path(@user)
    end

  end

  def logout
    session.delete(:user_id)
    flash[:success] = "Logged out successfully"
    redirect_to root_path
  end
end
