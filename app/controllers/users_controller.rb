class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save #it worked
      flash[:success] = "Welcome, #{user.name}"
    else#
      flash.now[:alert] = @user.errors
      redirect_to login_form_path
    end
  end



  private

  def user_params
    # You don't need an explicit return here, but if it helps keep things straight in your head, it's okay to do it.
    params.require(:user, :name)
  end
end
