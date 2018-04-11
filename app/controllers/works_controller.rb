class WorksController < ApplicationController
  def index
    @movies = Work.where(category: 'movie')
    @books = Work.where(category: 'book')
    @albums = Work.where(category: 'album')
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
    #add loop to delete all votes assoc. with particular user?
  end
end
