class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if work.save
      redirect_to work_path(work.id)
    end

  end

  def edit
    @work = Work.find(params[:id])

  end

  def update

  end

  def show

  end

  def destroy

  end

  private
  def work_params
      return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
    end



end
