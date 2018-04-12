class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name], joined: params[:user][:joined])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.name} is successfully logged in"
      session[:logged_in_user] = true

      redirect_to user_path(user)


    else
      @user = User.create(name: params[:user][:name], joined: params[:user][:joined])
      session[:logged_in_user] = true
      session[:user_id] = @user.id



      redirect_to user_path(@user)
    end


  end



  def destroy
    reset_session
    redirect_to root_path
  end


end
