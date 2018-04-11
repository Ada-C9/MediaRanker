class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]

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

  private

  def find_work
    @work = Work.find_by(id: params[:id])
  end
end
