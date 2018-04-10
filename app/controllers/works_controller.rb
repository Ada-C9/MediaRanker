class WorksController < ApplicationController

  def index
    @works = Work.all

    @albums = Work.where(category:'album')
    
    @books = Work.where(category:'book')

    @movies = Work.where(category:'movie')
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.new(work_params)
  end

  def show
    work_id = params[:id]

    @work = Work.find(work_id)
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

  def destroy
    @work = Work.find(params[:id])

    redirect_to works_path
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :created_by, :votes, :published_year, :description)
  end
end
