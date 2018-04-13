class UsersController < ApplicationController
  # before_action :find_user, only: [:show, :edit, :update]

def index
  @users = User.all
end

def show
  @user = User.find_by(id: params[:id])
end

def create
end

def edit
end

def update
end

def destroy
end

private
#
# def find_user
#   @user = User.find(params[:id])
# end

end
