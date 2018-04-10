class PublicationsController < ApplicationController
  def index
    @albums = Publication.where(category: "album")
    @books = Publication.where(category: "book")
    @movies = Publication.where(category: "movie")
    @spotlight = Publication.first
  end

  def show

  end

  def create
  end

  def destroy
  end

  def new
  end

  def edit
  end

  def update
  end
end
