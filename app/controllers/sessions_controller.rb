class SessionsController < ApplicationController



def create
  @username = User.find_by name: params[:user][:name]

  if @username
    session[:user_id] = @username.id
    flash[:success] = "Successfully logged in as exisisting user #{@username.name} with ID #{@username.id}"
  else
    @username = User.create name: params[:user][:name]
    session[:user_id] = @username.id
    flash[:success] = "Successfully created #{@username.name} with ID #{@username.id}"
  end
  redirect_to homepage_path
end

def new
  @username = User.new

end

def destroy
  session[:user_id] = nil
  flash[:success] = "Successfully logged out"
  redirect_to homepage_path
end

end
