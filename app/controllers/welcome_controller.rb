class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @spotlight = Work.top(1)[0]
    @albums = Work.top(10, "album")
    @books = Work.top(10, "book")
    @movies = Work.top(10, "movie")
  end
end
