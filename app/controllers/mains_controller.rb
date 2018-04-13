class MainsController < ApplicationController
  # before_action :find_user

  def index
    albums = Publication.where(category: "album")
    @albums = albums.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').limit(10)
    books = Publication.where(category: "book")
    @books = books.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').limit(10)
    movies = Publication.where(category: "movie")
    @movies = movies.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').limit(10)
    @spotlight = Publication.first
  end
end
