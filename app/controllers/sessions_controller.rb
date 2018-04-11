class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def login
    user = User.find_by(name: params[:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name } is successfully logged in"
      redirect_to root_path
    else
      user = User.new(name: params[:name])
    end

  end

end
