class SessionsController < ApplicationController

  def new
    @potential_user = User.new
  end

  def create
    # this below is if user already exists

    @this_user = User.find_by(name: params[:user][:name])

    if !@this_user.nil? # <-- also can be "if @this_user"
      # below saves user's id to session
      session[:user_id] = @this_user.id
      flash[:success] = "#{ @this_user.name } is successfully logged in"
      redirect_to root_path

      # this below is if user DOES NOT already exist
    else
      # try to make a new user
      @this_user = User.create(name: params[:user][:name])
      session[:user_id] = @this_user.id

      flash[:success] = "#{ @this_user.name } has been created"
      redirect_to root_path
    end
  end


  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end
end
