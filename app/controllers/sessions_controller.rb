class SessionsController < ApplicationController

  # before_action :find_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by name: params[:user][:name]
    # binding.pry
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.name}!"
    else
      @user = User.create(user_params)
      # @user = User.create(name: params[:user][:name], joined: Time.now.strftime("%m%Y"))
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.name}!"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out!"
    redirect_to root_path
  end

  private
  def user_params
    return params.require(:user).permit(:name, :created_at)
  end
end
