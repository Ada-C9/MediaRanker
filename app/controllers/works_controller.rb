class WorksController < ApplicationController
  def index
    @works = Work.all
    @albums = @works.where(category: "album")
    @books = @works.where(category: "book")
    @movies = @works.where(category: "movie")
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
