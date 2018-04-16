class SessionsController < ApplicationController
  before_action :find_user

  def new
    @current_user = User.new
  end

  def login
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.username } is successfully logged in"
      redirect_to root_path
    end
  end

  def create
    # username = params[:username]
    @current_user = User.find_by username: params[:user][:username]
    if @current_user
      session[:user_id] = @current_user.id
      flash[:success] = "Successfully logged in as existing user #{@current_user.username}"
    else
      @current_user = User.create username: params[:user][:username]
      session[:user_id] = @current_user.id
      flash[:success] = "Successfully created new user #{@current_user.username} with ID #{@current_user.id} "
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
