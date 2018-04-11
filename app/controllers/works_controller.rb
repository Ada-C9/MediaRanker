class WorksController < ApplicationController
  def index
    @works = Work.all
    @albums = Work.where(category: 'album')
    @books = Work.where(category: 'book')
    @movies = Work.where(category: 'movie')

  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "Successfully saved #{params[:category]} #{params[:work_id]}"
      redirect_to work_path(params[:id])
    else
      flash[:failure] = "A problem occurred: Could not create #{params[:category]}"
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    updated_info = params[:work]
    @work = Work.find(params[:id])
    @work.assign_attributes(updated_info)

    if @work.save
      flash[:success] = "Successfully saved #{params[:category]} #{params[:work_id]}"
      redirect_to work_path(work)
    else
      flash[:failure] = "A problem occurred: Could not update #{params[:category]}"
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])
    flash[:success] = "Successfully destroyed #{params[:category]} #{params[:work_id]}"
    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
