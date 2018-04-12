class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name } is successfully logged in"
    else
      user = User.create(name: params[:user][:name])
      flash[:success] = "New user #{ user.name } successfully created"
    end
    redirect_to root_path
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "Logged out successfully"

    redirect_to root_path

  end

  helper_method :current_user

end
