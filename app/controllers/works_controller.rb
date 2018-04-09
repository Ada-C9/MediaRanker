class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new

  end

  def edit

  end

  def create

  end

  def show

  end

  def destroy

  end

  private
  def work_params
    return params.require(:work).permit(:title, :description, :creator, :publication_year)
  end
end
