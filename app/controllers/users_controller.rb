class UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  
end
