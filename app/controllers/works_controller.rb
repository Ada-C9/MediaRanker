class WorksController < ApplicationController
  # TODO: Add before action to support controller filters :show,:edit and update

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

  def show
    work_id = params[:id]

    @work = Work.find(work_id)# TODO: add controller filters to all duplicate user.find
  end

  def edit
    @work = Work.find(params[:id]) # TODO: add controler filter
  end

  def update
    @work = Work.find(params[:id]) # TODO: add controller filters

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
  # TODO: add method for find a work to support controller filter
  def work_params
    return params.require(:work).permit(:category, :title, :created_by, :votes, :published_year, :description)
  end
end
