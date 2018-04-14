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
    @show_user = User.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
