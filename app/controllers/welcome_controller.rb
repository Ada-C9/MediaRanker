class WelcomeController < ApplicationController
  def index
    @albums = Work.order_albums[0..9]
    @books = Work.order_books[0..9]
    @movies = Work.order_movies[0..9]
    @spotlight = Work.find_spotlight
  end
end
