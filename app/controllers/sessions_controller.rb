class SessionsController < ApplicationController

  def create
    @user = User.find_by user_name: params[:user][:user_name]


    if @user
      session[:user_id] = @user.id
    else
      @user = User.create user_name: params[:user][:user_name]
      session[:user_id] = @user.id
    end
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
