class UsersController < ApplicationController

def index
  @user = User.all
end

def new
  user = User.new
end

def create


end

def show
  user = User.find(params[:id])
end

private
def user_params
  return params.require(:user).permit(:name, :username, :pasword)
end


end
