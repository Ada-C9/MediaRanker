class SessionsController < ApplicationController
  before_action :find_user, only: [:destroy]

  def new
    @potential_user = User.new
  end

  def create
    @this_user = User.find_by(name: params[:user][:name])
    if @this_user
      session[:user_id] = @this_user.id
      flash[:notice] = "Successfully logged in as existing user #{@this_user.name}"
    else
      @this_user = User.create(name: params[:user][:name])
      session[:user_id] = @this_user.id
      flash[:notice] = "Successfully created new user #{@this_user.name} with ID #{@this_user.id}"
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
