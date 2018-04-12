class SessionsController < ApplicationController



def create
  @user = User.find_by name: params[:user][:name]

  if @user
    session[:user_id] = @user.id
    flash[:success] = "Successfully logged in as exisisting user #{@user.name} with #{@user.id}"
  else
    @user = User.create name: params[:user][:name]
    session[:user_id] = @user.id
    flash[:success] = "Successfully created #{@user.name} with #{@user.id}"
  end
  redirect_to root_path
end

def new
  @user = User.new
end

end
