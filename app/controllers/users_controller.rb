class UsersController < ApplicationController
  before_action :find_session_user
  def index
    @users = User.all.order(created_at: :asc)
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

  def destroy
  end
end
