class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @current_user = User.find(params[:id])
    render_404 unless @current_user
  end
end
