class WorksController < ApplicationController
  def index
    @works = Work.all
    # @movies = Work.where(category: "movie")
    # @books = Work.where(category: "book")
    # @albums = Work.where(category: "album")
  end

  def new
  end

  def show
    id = params[:id]
    @work = Work.find(id)
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def create
  end

  def update
  end

  def destroy
    id = params[:id]
    @work = Work.find(id)
    @work.destroy
    redirect_to works_path
  end
end
