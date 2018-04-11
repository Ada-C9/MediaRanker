class WorksController < ApplicationController
  # nic, used
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  # def create
  #   @works = Work.new(work_params)
  # end
  def top_media
    @top_albums = Work.top_albums
    @top_movies = Work.top_movies
    @top_books = Work.top_books
  end

  def show
    # work_id = params[:id]
    # @works =  Work.find(work_id)
  end

  private
  def work_params
    params.require(:work).permit(:title, :created_by, :publication_date, :description, :category)
  end

end
