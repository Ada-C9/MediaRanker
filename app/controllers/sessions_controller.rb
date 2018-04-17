class SessionsController < ApplicationController
  before_action :find_user

  def new
    @current_user = User.new
  end

  # def login
  #   user = User.find_by(username: params[:username])
  #   if user
  #     session[:user_id] = user.id
  #     flash[:success] = "#{ user.username } is successfully logged in"
  #     redirect_to root_path
  #   end
  # end

  def create
    # username = params[:username]
    @user = User.find_by username: params[:user][:username]
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.username}"
    else
      @user = User.create username: params[:user][:username]
      session[:user_id] = @user.id
      flash[:success] = "Successfully created new user #{@user.username} with ID #{@user.id} "
    end
    redirect_to root_path
  end

  def destroy
    if @user
      session[:user_id] = nil
      flash[:status] = :success
      flash[:result_text] = "Successfully logged out"
      redirect_to root_path
    end

  end
