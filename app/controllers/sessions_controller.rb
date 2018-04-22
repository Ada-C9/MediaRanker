class SessionsController < ApplicationController

  def login
    user = User.find_by(name: params[:name])
    if user.nil? # user doesn't exist yet
      user = User.new(name: params[:name])
      user.save
      flash[:success] = "#{ user.name } is created and successfully logged in"
    else # user already exists
      flash[:success] = "Successfully logged in as existing user #{ user.name }"
    end
    session[:user] = user
    redirect_to root_path
  end

  def logout
    session[:user] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end

end
