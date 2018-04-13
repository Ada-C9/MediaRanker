class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def login
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name } is successfully logged in"
      redirect_to user_path(user)
    else
      @user = User.new(name: params[:user][:name])
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Successfully logged in as existing user #{ @user.name }"
        redirect_to root_path
      else
        # bad name or something
        flash.now[:failure] = "A problem occurred: Could not log in"
        flash.now[:error] = @user.errors.messages[:name]
        render :new
      end
    end
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "Logged out successfully"
    redirect_to root_path
  end
end
