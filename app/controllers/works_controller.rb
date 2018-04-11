class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @work = Work.new
  end

  def create
  end

  def destroy
  end

  private
  def user_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description, :id )
  end
end
