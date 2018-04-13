class WorksController < ApplicationController

  def index
    @albums = Work.top('album')
    @books = Work.top('book')
    @movies = Work.top('movie')
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def create
    @work = Work.new(work_params)
    # TODO: need validations

    if @work.save
      flash[:success] = "Work added successfully"
      redirect_to works_path
    else
      flash.now[:failure] = "Failed"
      render :new
    end
  end

  def new
    @work = Work.new
  end

  def update
    @work = Work.find(params[:id])

    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path
    end
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to works_path
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
