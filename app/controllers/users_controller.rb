class UsersController < ApplicationController
  before_action :find_user, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
  end

end
