class SessionsController < ApplicationController

# 1.) Get the username from the posted form.
# 2.) Check if that username is already in the User's table.
# 3.) If it does exist, then update the session[:user_id] with the found user_id
# 4.) If the user does NOT exist, then create the User and save that new user_id into session[:user_id]


  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.name} is successfully logged in."
      redirect_to root_path
    else
      new_user = User.new(name: params[:user][:name])

      new_user.save

      redirect_to root_path
    end
  end

  def destroy
    # session[:user_id] = nil
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."

    redirect_to root_path
  end

end
