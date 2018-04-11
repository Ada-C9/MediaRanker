class WorksController < ApplicationController
  def edit
  end

  def index
    @works = Work.all
  end

  def new
  end

  def show
    @work = Work.find(params[:id])
  end

  def create
  end

  def destroy
    @work = Work.find(params[:id])
    if @work != nil
      @work.destroy
    end
    redirect_to works_path
  end

  def update
    @work = Work.find_by(id: params[:id])
    if @work.update(driver_params)
      redirect_to work_path
    else
      render :edit
    end
  end


  private

  def driver_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
