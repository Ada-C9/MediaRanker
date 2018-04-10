module GetUsername

  def get_username
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      return nil
    end
  end

end
