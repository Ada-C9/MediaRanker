class SessionsController < ApplicationController

def new
  @user = User.new
end

def create
  user = User.find_by(name: params[:user][:name])

  if user
    session[:user_id] = user.id
    flash[:success] = "#{user.name} has successfully logged in"
    redirect_to root_path
  else
    @user = User.create(name: params[:user][:name])
    flash[:success] = "Username successfully created: #{@user.name} "
  end
end

end
