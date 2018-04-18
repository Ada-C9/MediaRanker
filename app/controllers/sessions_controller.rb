class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by username: params[:user][:username]

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Wecome back #{@user.username}"
    else
      user = params[:user][:username]
      date = Date.today
      @user = User.create(username: user, join_date: date)
      session[:user_id] = @user.id
      flash[:success] = "Wecome #{@user.username}"
    end

    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end
end
