class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new

  end

  def create

  end

  def show

  end

  def login

  end

  private
 def user_params
   return params.require(:user).permit(:name)
 end

end
