class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def main
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to "/works"
    else
      render :new
    end
  end

  def show
    work_id = params[:id]

    @work = Work.find_by(id: work_id)
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
