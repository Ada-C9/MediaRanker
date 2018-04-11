class WorksController < ApplicationController

  # TODO undestand this
  def index
    works = Works.all
    # @albums = Work.where(category: "album")
  end


  # TODO undestand this
  def show
  @work = Work.find_by(id: params[:id].to_i)
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

  # TODO undestand this
  def work_params
    return
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end


end
