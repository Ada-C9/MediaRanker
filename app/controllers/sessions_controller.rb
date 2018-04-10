class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    input = params[:user][:username]
    user = User.find_by(username: input)

    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.username}"
      redirect_to root_path
    else
      user = User.new(username: input)
      user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully created new user #{user.username} with ID #{user.id}"
      redirect_to root_path
    end
  end

  def destroy
    # session[:author_id] = nil => this is another way to do the same thing
    session.delete(:user_id)
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
