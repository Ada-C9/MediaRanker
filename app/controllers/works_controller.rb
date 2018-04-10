class WorksController < ApplicationController

  def index
    @works = Work.all
    @types = ["movie", "book", "album"]
  end

  def show
    @work = Work.find(params[:id].to_i)
  end

  def create
  end

  def new
    @work = Work.new
  end

  def destroy
    @work = Work.find(params[:id].to_i).destroy
    flash[:success] = "Deleted the work"
    redirect_to works_path
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id].to_s)
    redirect_to work_path unless @work

    @work.update_attributes work_params
    if @work.update_attributes work_params
      redirect_to works_path
      flash[:success] = "Updated #{@work.title}"
    else
      render :edit
    end
  end

  def top
    @types = ["movie", "book", "album"]
  end


end
