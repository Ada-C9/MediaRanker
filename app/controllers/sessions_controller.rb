class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.name}."
    else
      @user = User.create name: params[:user][:name]
      session[:user_id] = @user.id
      if !@user.id.nil?
        flash[:success] = "Successfully logged in as user #{@user.name}."
      else
        flash[:alert] = @user.errors
      end
    end
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end

end
