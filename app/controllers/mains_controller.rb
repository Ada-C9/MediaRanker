class MainsController < ApplicationController

  def index
    @albums = Publication.highest(10, "album")
    @books = Publication.highest(10, "book")
    @movies = Publication.highest(10, "movie")
    @spotlight = Publication.spotlight
  end
end
