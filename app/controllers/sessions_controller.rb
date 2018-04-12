class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name] )

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name } is successfully logged in"

      session[:logged_in_user] = true
      redirect_to root_path

    else
      @user = User.new(name: params[:user][:name])
      if @user.save
        session[:logged_in_user] = true
        session[:user_id] = @user.id
        flash[:success] = "successfully logged in as existing user #{@user.name}"
        redirect_to root_path
      else
        flash[:failure] = "You could not login"
        render :new
      end
    end



  end



  def destroy
    reset_session
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end


end
