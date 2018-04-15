class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "#{ @user.name } is successfully logged in."
    else
      @user = User.create(name: params[:user][:name])
        session[:user_id] = @user.id
        flash[:success] = "#{ @user.name } is successfully created and logged in."
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end
end
