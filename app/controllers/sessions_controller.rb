class SessionsController < ApplicationController
  before_action :find_user, only: [:create, :destroy]

  def new
    @potential_user = User.new
  end

  def create
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in as existing user #{@user.name}"
    else
      @user = User.create(name: params[:user][:name])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully created new user #{@user.name} with ID #{@user.id}"
    end
    redirect_to root_path
  end

  def destroy
    if @user
      session[:user_id] = nil
      flash[:success] = "Successfully logged out"
      redirect_to root_path
    end
  end

end
