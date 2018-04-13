class WorksController < ApplicationController
  before_action :find_work, only: [:show,:edit,:update]

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
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = 'Work added successfully'
      redirect_to works_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update

    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(work)
    else
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to works_path
  end

  def top
    @works = Work.all # TODO: add all media types and filter by votes top 10.
  end

  private

  def find_work
    @work = Work.find_by_id(params[:id])
  end

  def work_params
    return params.require(:work).permit(:category, :title, :created_by, :votes, :published_year, :description)
  end
end
