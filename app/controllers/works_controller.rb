class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update]


  def main
    @works = Work.all
    @albums = Work.albums
    @movies = Work.movies
    @books = Work.books
  end

  def index
    @works = Work.all
    @albums = Work.albums
    @movies = Work.movies
    @books = Work.books
  end

  def show; end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Work added successfully"
      redirect_to works_path
    else

      flash.now[:failure] = "Validations Failed"
      render :new
    end
  end

  def edit;end

  def update
    @work.assign_attributes(work_params)
    if @work.save
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to works_path
  end

  private

  # TODO undestand this
  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find(params[:id])
  end


end
