class MainpageController < ApplicationController
  def index
    @top_albums = Work.where(category: 'album')
    @top_books = Work.where(category: 'book')
    @top_movies = Work.where(category: 'movie')
  end
end
