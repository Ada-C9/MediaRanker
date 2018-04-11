class MainController < ApplicationController
  def index
    @top_movies = Work.where(category: 'movie').limit(10)
    @top_books = Work.where(category: 'book').limit(10)
    @top_albums = Work.where(category: 'album').limit(10)
  end
  
end
