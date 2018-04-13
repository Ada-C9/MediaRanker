class SessionsController < ApplicationController
  def login_form; end

  def new
    @form_user = User.new
  end

# FIXME: Will not register me as logged in so I can vote
  def login
# **********
    user_name = params[:user][:user_name]

    if user_name and @user = User.find_by(user_name: user_name)
      session[:user_id] = @user.id
      flash[:result_text] = "Successfully logged in as exsisting user #{@user.user_name}"
    else
      @user = User.new(user_name: user_name)
      if @user.save
        session[:user_name] = @user.user_name
        flash[:result_text] = "Successfully created new user #{@user.user_name} with ID #{@user.id}."
      else
        flash.now[:status] = :failure
        flash.now[:message] = @user.errors.messages
        render "new", status: :bad_request
        return
      end
    end
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    flash[:result_text] = "Logged out successfully."

    redirect_to root_path
  end
end
