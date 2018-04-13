class UsersController < ApplicationController
  def edit
  end

  def index
    @users = User.all
  end

  def new
  end

  def show
    @this_user = @user
  end

  def create
  end

  def destroy
  end

  def update
  end
end
