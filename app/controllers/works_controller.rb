class WorksController < ApplicationController
  def index
    @works = Work.all

    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")
  end

  def new
  end

  def create
  end

  def show
    id = params[:id]
    @work = Work.find(id)
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
