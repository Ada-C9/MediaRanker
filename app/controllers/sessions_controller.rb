class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.username}"
      redirect_to root_path
    else
      @user = User.new(username: params[:user][:username])
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Successfully created new user #{@user.username} with ID #{@user.id}"
        redirect_to root_path
      else
        @user_errors = @user.errors.messages
        flash.now[:failures] = "A problem occurred: Could not log in"
        render :new
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
