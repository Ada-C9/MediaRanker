class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update,:destroy]

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

  end

  def edit


  end


  def update
  end

  def destroy
  end
  private
  def work_params
    return params.require(:work).permit(:category, :title, :created, :publication_year, :description)
  end
  def find_work
    @work = Work.find(params[:id])
  end

end
