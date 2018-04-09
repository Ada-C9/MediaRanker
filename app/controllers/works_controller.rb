class WorksController < ApplicationController
  def index
    @albums = Work.all.where(category: "album")
    @books = Work.all.where(category: "book")
    @movies = Work.all.where(category: "movie")
  end

  def show
    @work = Work.find_by(id: params[:id])
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
    if !@work.nil?
      if @work.update(work_params)
        redirect_to work_path
      else
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
