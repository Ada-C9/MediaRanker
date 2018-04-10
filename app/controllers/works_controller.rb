class WorksController < ApplicationController
  def index
  end

  def show
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
  def works_params
    return params.require(:work).permit(:title, :creator, :publication_year, :category, :description)
  end
end
