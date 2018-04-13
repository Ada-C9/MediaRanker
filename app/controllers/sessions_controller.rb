class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:name])

    if user
      session[:logged_in_user] = user.id
      flash[:success] = "#{user.name} is successfully logged in"
      redirect_to root_path
    else
      user = User.new(name: params[:name], created_at: Date.today)
      user.save
      flash[:success] = "Successfully created new user #{user.name} with ID #{user.id}"
      session[:logged_in_user] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:logged_in_user] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
