class UsersController < ApplicationController

  before_action :current_user

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
