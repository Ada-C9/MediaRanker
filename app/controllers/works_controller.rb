class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.assign_atrributes(work_params)
    if @work.save
      #  ?
      redirect_to work_path(work)
    else
      render :edit
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private
  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
