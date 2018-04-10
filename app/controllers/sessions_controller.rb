class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.username } is successfully logged in."
      redirect_to root_path
    else

    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end

end
