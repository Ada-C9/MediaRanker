class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = params[:user]
    @user = User.find_by(username: user[:username])

    # check if using if @user is better
    if @user.nil?
      @user = User.new(username: user[:username])
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = 'Successfully created user and logged in'
        redirect_to root_path
      else
        flash.now[:failure] = 'Unable to create user and login'
        render :new
      end
    else
      session[:user_id] = @user.id
      flash[:success] = "#{@user.username} successfully logged in"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
