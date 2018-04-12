class UsersController < ApplicationController

   before_action :find_user, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
