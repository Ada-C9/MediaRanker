class WelcomesController < ApplicationController
  def index
    @movies = Work.movies.top_ranked.limit(10)
    @books = Work.books.top_ranked.limit(10)
    @albums = Work.albums.top_ranked.limit(10)
    @spotlight = Work.top_ranked.first
  end
end
