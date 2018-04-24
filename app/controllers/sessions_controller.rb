class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.username}"
      redirect_to root_path
    elsif
      user = User.create(username: user_params[:username])
      user.save
      if user
        session[:user_id] = user.id
        flash[:success] = "Successfully created new user #{user.username} with ID #{user.id}"
        redirect_to root_path
      end
    else
      flash[:failure] = "Could not login as #{user_params[:username]}"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    session.delete(:user_id)
    flash[:success] = "Successfully logged out"

    redirect_to root_path
  end

private

def user_params
  return params.require(:user).permit(:username)
end

end
