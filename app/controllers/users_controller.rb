class UsersController < ApplicationController

  before_action :find_user

  def index
    @users = User.all
  end

  def show
  end

end
