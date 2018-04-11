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

  def edit
  end

  def show
    @work = Work.find(params[:id])

  end


  def destroy
  end

  private
  def work_params
    params.require(:work).permit(:category,:title,:creator,:publication_year,:description)
  end
end
