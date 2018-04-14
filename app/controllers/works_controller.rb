class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update]
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to work_path(@work.id)
    end

  end

  def edit
    @work = Work.find(params[:id])

  end

  def update
    work.assign_attributes(work_params)

    if work.save
      redirect_to work_path(work)
    end
  end

  def show

  end

  def destroy

  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    work = params[:id]
    @work = Work.find(work)

  end
end
