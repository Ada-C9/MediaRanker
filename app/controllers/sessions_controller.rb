class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.name}"
      redirect_to root_path
    # else
    #   #need logic here if a new user
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
