class SessionsController < ApplicationController
  def create
    @user = User.find_by name: params[:user][:name]

    if @user
      session[:user_id] = @user.id
      flash[:sucess] = "Successfully logged in as existing user #{@user.name}"
    else
      @user = User.create name: params[:user][:name]
      session[:user_id] = @user.id
      flash[:sucess] = "Successfully logged in as existing user #{@user.name}"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:sucess] = "You logged out!"
    redirect_to root_path
  end

  def new
    @user = User.new
  end
end
