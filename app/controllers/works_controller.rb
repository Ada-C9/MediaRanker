class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def create
  end

  def new
    @work = Work.new(work_params)
  end

  def edit
  end

  def show
    id = params[:id]
    @work = Work.find_by(id: id)
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
