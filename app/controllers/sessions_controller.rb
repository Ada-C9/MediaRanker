class SessionsController < ApplicationController
  def new
    @work = Work.new
  end

  def login
    user = User.create(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name } is successfully logged in"
      redirect_to root_path
    else
    redirect_to user_path(user)

  end

  # def logout
  #   session.delete(:user_id)
  #   flash[:success] = "Logged out successfully"
  # end
end
