class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.name} is successfully logged in."
      redirect_to root_path

    else

      if session[:user_id] == nil
        @user = User.new(name: params[:user][:name])


        if @user.save
          flash[:success] = "#{@user.name} successfully created a new log in."
          session[:user_id] = @user.id
          redirect_to root_path
        end

        else

          flash.now[:failure] = 'Validations Failed'

          render :new
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Logged out successfully'

    redirect_to root_path
  end

end
