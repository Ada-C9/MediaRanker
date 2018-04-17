class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.name} is successfully logged in."
      redirect_to root_path
    else
      new_user = User.new(name: params[:user][:name])

      new_user.save

      redirect_to root_path
    end
  end

  def destroy
    # session[:user_id] = nil
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."

    redirect_to root_path
  end

end
