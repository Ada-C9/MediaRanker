class WorksController < ApplicationController
  def index
    @works = Work.all

    @books = Work.where(category: "book")
    @albums = Work.where(category: "album")
    @movies = Work.where(category: "movie")

  end

  def show
    id = params[:id]
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])

    if @work.update(work_params)
      redirect_to work_path(@work.id)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
