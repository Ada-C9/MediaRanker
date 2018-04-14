class UsersController < ApplicationController
  before_action :find_user, only: [:index, :show]

  def index
    @users = User.all

  end

  def show
    @this_user = User.find_by(id: params[:id])
  end

end
