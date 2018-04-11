class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.name}"
      redirect_to root_path
    else
      #need logic here if a new user
      @user = User.new(name: params[:user][:name])
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
        redirect_to root_path
      else
        flash[:error] = "A problem occurred: Could not log in"
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
