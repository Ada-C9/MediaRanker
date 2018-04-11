class UsersController < ApplicationController
  def edit
  end

  def index
    @user = User.find_by(id: session[:user_id] )
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def update
  end
end
