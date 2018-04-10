class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
      @users = User.all
    end

    def show
     end

    def create
    end

    def destroy
      @user.destroy
      redirect_to users_path
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
    end

    def login
    end

    def logout
    end

    def find_user
    end

  private
    def user_params
      params.require(:user).permit(:name)
    end


  end
