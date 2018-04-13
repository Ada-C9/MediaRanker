class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    # FIXME: NEED THIS BIT TO SUCCESSFULLY DISPLAY USER_NAME and redirect to top media page********
    if @user
      session[:user_id] = @user.id
      flash[:success] = "#{@user.user_name}is successfully logged in"
      @users << @user
      redirect_to root_path
    end
    # ********************************
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."

    redirect_to root_path
  end
end
