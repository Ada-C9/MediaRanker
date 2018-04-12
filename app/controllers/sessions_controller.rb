class SessionsController < ApplicationController



def create
  @user = User.find_by name: params[:user][:name]

  if @user
    session[:user_id] = @user.id
    flash[:success] = "Successfully logged in as exisisting user #{@user.name} with ID #{@user.id}"
  else
    @user = User.create name: params[:user][:name]
    session[:user_id] = @user.id
    flash[:success] = "Successfully created #{@user.name} with ID #{@user.id}"
  end
  redirect_to root_path
end

def new
  @user = User.new
end

def destroy
  #create destroy method!!!
  session[:user_id] = nil
  flash[:success] = "Successfully logged out"
  redirect_to root_path

end

end
