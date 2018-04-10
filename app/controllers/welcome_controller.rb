class WelcomeController < ApplicationController
  def index
    @spotlight = Work.first
    @movies = Work.where(category: 'movie')
    @books = Work.where(category: 'book')
    @albums = Work.where(category: 'album')
  end
end
