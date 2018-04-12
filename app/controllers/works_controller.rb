class WorksController < ApplicationController


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

  def show
    @work = Work.find_by(id: params[:id].to_i)
  end

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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # TODO undestand this
  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end


end
