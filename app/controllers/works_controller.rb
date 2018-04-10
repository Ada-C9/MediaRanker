class WorksController < ApplicationController
  def index
    @works = Work.all.order(params[:id])
  end

  def show
    @work = Work.all.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to work_path(@work.id)
    else
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    if !@work.nil?
      @work.update(work_params) ? (redirect_to work_path(@work.id)) :
      (render :edit)
    else
      redirect_to works_path
    end
  end

  def destroy
    Work.all.find(params[:id]).destroy
    redirect_to works_path
  end

  def work_params
    params.require(:work).permit(:work_title, :work_creator, :work_description, :work_category,
      :work_publication_year)
    end

  end
