class WorksController < ApplicationController
  def index
    @albums = Work.where(category:"album")
    @books = Work.where(category:"book")
    @movies = Work.where(category:"movie")
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:notice] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private

def work_params
  return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
end
