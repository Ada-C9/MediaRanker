class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @show_user.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
