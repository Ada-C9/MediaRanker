class UsersController < ApplicationController

  # before_action :find_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @show_user = User.find_by(id: params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:sucess] = "Welcome #{@user.user_name}!"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = @user.errors
      render :new
    end
  end

  def update
    if !@user.nil?
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    end
  end

  def destroy
  end

  private

  def user_params
    return params.require(:work).permit(:user_name)
  end

  # def find_user
  #   @user = User.find_by(id: params[:id])
  # end


end
