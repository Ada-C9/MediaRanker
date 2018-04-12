class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.name}"
    else
      @user = User.create(name: params[:user][:name])
      session[:user_id] = @user.id
      flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
    end

    redirect_to main_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to main_path
  end

end
