class SessionsController < ApplicationController
  # def create
  #   #@user = User.find_by(username: params[:user][:username])
  #   @new_user = User.new(username: params[:username],date_joined: Date.today)
  #   if @new_user.save(username: params[:username],date_joined: Date.today)
  #     session[:user_id] = @new_user.id
  #     flash[:success] = "Successfully created new user #{params[:username]} with ID #{@new_user.id}"
  #     redirect_to root_path
  #   else
  #     flash.now[:error] = "Username #{params[:username]} was not created"
  #
  #   end
  # end


  def create
    @user = User.find_by(username: params[:user][:username])

    if @user
      session[:user_id] = @user.id

      flash[:success] = "Welcome back #{@user.username}"
    else
      @user = User.create(username: params[:user][:username],date_joined: Date.today)
      if session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.username}"
        redirect_to root_path
      else
        flash.now[:error] = "Username was not created"
        render :new
      end
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end
end
