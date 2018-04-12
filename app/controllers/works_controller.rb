class WorksController < ApplicationController

  def index
    @movies = Work.all_movies
    @books = Work.all_books
    @albums = Work.all_albums
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])

    work.assign_attributes(work_params)

    if work.save
      redirect_to work_path(work)
    end
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.new(work_params)

    if work.save
      redirect_to work_path(work.id)
    else
      render :new
    end

  end

  def destroy
    if Work.destroy(params[:id])
      redirect_to works_path
    end
  end

private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
