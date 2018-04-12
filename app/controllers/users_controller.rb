class UsersController < ApplicationController
  def index
  end

  def show
    @show_user = User.find_by name: params[:user][:name]
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
