class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # def find_work
  #   @user = Work.find_by id: params[:id]
  # end

end
