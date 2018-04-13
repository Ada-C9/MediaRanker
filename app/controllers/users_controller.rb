class UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    # @show_user = User.find(session[:user_id])
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
    #add loop to delete all votes assoc. with particular user?
  end
end
