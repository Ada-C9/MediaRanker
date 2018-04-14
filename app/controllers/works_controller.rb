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
      redirect_to works_path
    else
      render :new
    end
  end

  def show
    @votes = Vote.all
  end

  def edit; end

  def update

    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find_by(id: params[:id])
    work.vote.delete_all

    if work
      work.destroy
    end

    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :creator, :category, :description, :publication_year)
  end

  def find_work
    @work = Work.find(params[:id])
  end
end
