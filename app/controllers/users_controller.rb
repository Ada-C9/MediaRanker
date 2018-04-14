class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to users_path
    end
  end

  def show
    user_id = params[:id]

    @user = User.find_by(id: user_id)

    # if @user == nil
    #   #redirect_to catch_all_index_path
    # end

  end

  def vote
  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end
end
