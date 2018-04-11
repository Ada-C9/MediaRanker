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
      # other logic that does more stuff
      @user = User.new
      flash[:success] = "#{ @user.user_name } You successfully created a user!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."

    redirect_to root_path
  end
end
