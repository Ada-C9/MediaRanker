class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update]
  before_action :find_user

  def main
    @works = Work.all
    @albums = Work.albums
    @movies = Work.movies
    @books = Work.books
    @spotlight = Work.spotlight
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
      flash[:alert] = "A problem has occurred. Unable to add work!"
      flash[:notice] = @work.errors.full_messages
      # This: "status: :bad_request" has been added below because of the tests we wrote
      render :new, status: :bad_request
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

  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
    head :not_found unless @work
    flash[:notice] = "Work with id number #{params[:id]} could not be found!"
  end

end
