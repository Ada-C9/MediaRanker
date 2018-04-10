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
    flash[:success] = "Successfully created #{@work.category @work.id}"
    redirect_to works_path
    else
      flash.now[:alert] = ""
      render :new
    end

  end


  def edit
  end

  def destroy
  end

  private
  def work_params
    params.require(:work).permit(:category,:title,:creator,:publication_year,:description)
  end
end
