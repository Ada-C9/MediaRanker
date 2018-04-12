class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @movies = Work.all.where(category: "movie").limit(10)
    @books = Work.all.where(category: "book").limit(10)
    @albums = Work.all.where(category: "album").limit(10)
  end
end
