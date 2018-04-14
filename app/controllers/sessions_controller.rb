class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(user_name: params[:user][:user_name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.user_name } is successfully logged in."
      redirect_to root_path
    else
      @user = User.new(user_name:params[:user][:user_name])
      if @user.save
        redirect_to user_path(@user.id)
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."

    redirect_to root_path
  end
end
