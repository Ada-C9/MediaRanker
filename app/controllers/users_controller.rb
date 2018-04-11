class UsersController < ApplicationController
  before_action :find_user

  def edit
  end

  def index
    @users = User.all
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
