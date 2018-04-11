class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
    flash[:success] = "#{ @user.name } is successfully logged in."
      redirect_to root_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new
    end
  end

  def destroy
    User.delete(params[:id])
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end
end
