class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by name: params[:user][:name]
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.name}"
      redirect_to root_path
    else
      @user = User.create name: params[:user][:name]
      if !@user.valid?
        flash[:notice]= "A problem occurred: Could not log in"
        flash[:alert] = @user.errors
        redirect_to login_form_path
      else
        session[:user_id] = @user.id
        flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
        redirect_to root_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end

end
