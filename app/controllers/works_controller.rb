class WorksController < ApplicationController
  def index
    works = Work.all
    @albums = works.where(category: 'album')
    @books = works.where(category: 'book')
    @movies = works.where(category: 'movie')
  end

  def show
    @work = Work.find(works_params)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def works_params
    return params.require(:work).permit(:title, :creator, :publication_year, :category, :description)
  end
end
