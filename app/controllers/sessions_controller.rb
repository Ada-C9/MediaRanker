class SessionsController < ApplicationController
  def login_form; end

# FIXME: CURRENTLY CANNOT LOGIN TO COMPLETE A VOTE
  def login
    user_name = params[:user_name]

    if user_name and user = User.find_by(user_name: user_name)
      session[:user_id] = user_id
      flash[:satus] = :success
      flash[:result_text] = "Successfully logged in as exsisting user #{user.user_name}"
    else
      user = User.new(user_name: user_name)
      if user.save
        session[:user_id] = user_id
        flash[:status] = :success
        flash[:result_text] = "Successfully created new user #{user.user_name} with ID #{user.id}."
        # FIXME: WHY DOES IT NOT LIKE CREATE
      else
        flash.now[:status] = :failure
        falsh.now[:message] = user.errors.messages
        render "login_form", status: :bad_request
        return
      end
    end
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    flash[:status] = :success
    flash[:result_text] = "Logged out successfully."

    redirect_to root_path
  end
end
