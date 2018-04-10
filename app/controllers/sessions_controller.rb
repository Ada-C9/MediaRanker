class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user

      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.username}"
      redirect_to root_path

    else

      user = User.new(username: params[:user][:username])

      if user.save
        session[:user_id] = user.id
        flash[:success] = "Successfully created new user #{user.username} with ID #{user.id}"
        redirect_to root_path
      else
        flash.now[:failure] = "Could not log in or create new user"
        render :new
      end

    end
  end

  def destroy
  end

end
