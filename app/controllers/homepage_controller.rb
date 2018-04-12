class HomepageController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @works = Work.all
    @books = Work.top_ten_books
    @albums = Work.top_ten_albums
    @movies = Work.top_ten_movies
    @sample = @works.sample
  end
end
