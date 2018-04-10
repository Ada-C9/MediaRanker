class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save #it worked
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to users_path
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if !@user.nil?

      # Materials commented out because we are now using strong params.
      # @book.update(title: params[:book][:title], author: params[:book][:author], description: params[:book][:description])

      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    else
      redirect_to users_path
    end
  end

  def destroy
    id = params[:id]
    @user = User.find(id)

    if @user.destroy #it worked
      redirect_to users_path
    else
      render :destroy
    end
  end

  private

  def user_params
    # You don't need an explicit return here, but if it helps keep things straight in your head, it's okay to do it.
    params.require(:user, :name)
  end
end
