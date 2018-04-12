class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name], joined: params[:user][:joined])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{@user.name} is successfully logged in"
      redirect_to user_path(user)
      session[:logged_in_user] = true

    else
      user = User.create(name: params[:user][:name], joined: params[:user][:joined])
      redirect_to user_path(user)

      session[:logged_in_user] = true

    end
  end



  def destroy
    reset_session
    redirect_to root_path 
  end


end
