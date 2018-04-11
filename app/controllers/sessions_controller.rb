class SessionsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id != nil
      flash[:success] = "Welcome #{@user.name}!"
      redirect_back(fallback_location: main_path)
    else
      flash.now[:alert] = "Could not create user"
      render :new
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def show
  end

  private

  def user_params
    return params.require(:user).permit(:name, :id)
  end
end
