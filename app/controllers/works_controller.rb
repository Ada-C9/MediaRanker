class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def creates
    if @work.save
    redirect_to works_path
    else
      render :new
    end
  end

  def show
    @work = Work.find_by(id: params[:id])
  end


  def destroy
    @work = Work.find_by(id: params[:id])
    if @work.destroy
      redirect_to works_path
    else
      render :show
    end
  end

  private
  def work_params
    params.require(:work).permit(:category,:title,:creator,:publication_year,:description)
  end
end
