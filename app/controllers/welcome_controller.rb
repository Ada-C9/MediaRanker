class WelcomeController < ApplicationController
  def index
    @spotlight = Work.first
    @albums = Work.where(category: 'album').take(10)
    @books = Work.where(category: 'book').take(10)
    @movies = Work.where(category: 'movie').take(10)
  end
end
