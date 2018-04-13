class SessionsController < ApplicationController

  # similar to new
  def page
    @user = User.new
  end

  # similar to create
  def login
    username = params[:user][:username]

    if User.find_by(username: username).nil?

      user = User.new(user_params)
      user.save

    else



    end

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
