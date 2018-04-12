class SessionsController < ApplicationController

  def new
    @newuser = User.new
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end

  def create
    # returns nil if not found
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.name} has successfully logged in"
      redirect_to root_path
    else
      @user = User.create(name: params[:user][:name])
      flash[:success] = "Username successfully created: #{@user.name} "
      redirect_to root_path
    end
  end

  def destroy
    # session[:author_id] = nil
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."

    redirect_to root_path
  end

end
