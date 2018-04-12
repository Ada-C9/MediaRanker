class UsersController < ApplicationController
  # TODO: add before action to support controller filters for :show :edit and :update
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

  def show
    user_id = params[:id]

    @user = User.find(user_id) # TODO: add controller filters to all duplicate user.find
  end

  def edit
    @user = User.find(params[:id]) # TODO: add controller filters to all duplicate user.find
  end

  def update
    @user = User.find(params[:id]) # TODO: add controller filters to all duplicate user.find

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
  # TODO: Add method for find a user to support controller filters
  def user_params
    return params.require(:user).permit(:name, :created_at)
  end
end
