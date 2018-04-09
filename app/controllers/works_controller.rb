class WorksController < ApplicationController
  def index
    @albums = Work.where(category:"album")
    @books = Work.where(category:"book")
    @movies = Work.where(category:"movie")
  end

  def show
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
end

private

def work_params
  return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
end
