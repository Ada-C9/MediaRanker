class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name } is successfully logged in."
      redirect_to votes_path
    else
      # other logic that does more stuff
    end
  end

  def destroy
    # session[:author_id] = nil
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."

    redirect_to votes_path
  end
end
