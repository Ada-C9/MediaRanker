module GetUsername

  def get_username
    @user = User.find(session[:user_id])
  end

end
