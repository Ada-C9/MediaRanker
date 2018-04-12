class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:success] = "#{@user.name} created"
  #     redirect_to root_path
  #   else
  #     flash[:alert] = {"#{@user.name}" => "creation failed"}
  #     render :new
  #   end
  # end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    return params.require(:user).permit(:name, :created_at)
  end
end
