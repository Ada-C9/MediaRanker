class MainsController < ApplicationController
  before_action :find_user

  def index
    @albums = Publication.where(category: "album").limit(10)
    @books = Publication.where(category: "book").limit(10)
    @movies = Publication.where(category: "movie").limit(10)
    @spotlight = Publication.first
  end
end
