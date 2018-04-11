class WorksController < ApplicationController
  def index
    def index
      @albums = Work.where(category: "album")
      @books  = Work.where(category: "book")
      @movies = Work.where(category: "movie")
    end

  end

  def show
    @work = Work.find_by(id: params[:id].to_i )
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
