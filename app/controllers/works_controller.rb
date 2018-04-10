class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    id = params[:id]
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])

    if @work.update(work_params)
      redirect_to work_path(@work.id)
    else
      render :edit
  end

  def destroy
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
