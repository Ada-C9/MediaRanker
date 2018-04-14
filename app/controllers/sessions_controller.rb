class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:logged_in_user] = @user.id
      flash[:success] = "#{user.name} is successfully logged in"
      redirect_to root_path
    else
      @user = User.new(name: params[:name], created_at: Date.today)
      if @user.save
        session[:logged_in_user] = @user.id
        flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
        redirect_to root_path
      else
        flash.now[:failure] = "A problem occurred. Could not log in"
        flash.now[:error] = @user.errors.messages
        render :new
      end
    end
  end

  def destroy
    session[:logged_in_user] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
