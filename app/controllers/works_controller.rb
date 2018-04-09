class WorksController < ApplicationController

  def index
    @works.Work.all
  end

  def new
    @work = Work.new(work_params)
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
    @works = Work.
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def work_params
    return params.require(:work).permit(:title, :publication_year, :description, :creator, :category)
  end
  end

end
