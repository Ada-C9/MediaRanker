class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
      @users = User.all
    end

    def show
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path
        flash[:success] = "Successfully created user #{@user.name}"
        # session[:logged_in] = @user
      else
        render :new
      end
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
      @user = User.find(params[:id])
    end

  private
    def user_params
      params.require(:user).permit(:name)
    end


  end
