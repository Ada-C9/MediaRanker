class SessionsController < ApplicationController
  before_action :find_user, only: [:destroy]

  def new
    @potential_user = User.new
  end

  def create
    name = params[:user][:name].strip
    @this_user = User.find_by(name: name)
    if @this_user
      session[:user_id] = @this_user.id
      flash[:success] = "Successfully logged in as existing user #{@this_user.name}"
    else
      @this_user = User.create(name: name)
      if @this_user.name.length < 1
        flash[:notice] = "A problem occurred: Could not login"
        flash[:alert] = { username: "can't be blank"}
      else
        session[:user_id] = @this_user.id
        flash[:success] = "Successfully created new user #{@this_user.name} with ID #{@this_user.id}"
      end
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
