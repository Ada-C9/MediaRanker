class SessionsController < ApplicationController

  # similar to new
  def page
    @user = User.new
  end

  # similar to create
  def login

    user = User.find_by(username: params[:user][:username])

    if user.nil?
      user = User.new(user_params)
      user.save

      flash[:message] = "Successfully created new user #{user.username} with ID #{user.id}"

    else
      flash[:message] = "Successfully logged in as existing user #{user.username}"
    end

    session[:user_id] = user.id
    flash[:status] = :success
    redirect_to root_path

  end

  # similar to destroy
  def logout
  end


  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to root_path
    else
      render :new
    end

  end


  private

  def user_params
    return params.require(:user).permit(:username)
  end

end
