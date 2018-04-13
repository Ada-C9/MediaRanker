class UsersController < ApplicationController
  before_action :find_user, only: [:show,:edit,:update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User added successfully'
      redirect_to root_path
    else
      flash.now[:failure] = 'Validations Failed'
      render :new
    end
  end

  def show; end

  def edit; end

  def update

    @user.assign_attributes(user_params)

    if @user.save
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def destroy
   User.destroy(params[:id])

    redirect_to users_path
  end

  private
  def find_book
    @user = User.find_by_id(params[:id])
  end
  
  def user_params
    return params.require(:user).permit(:name, :created_at)
  end
end
