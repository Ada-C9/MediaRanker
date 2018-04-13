class WorksController < ApplicationController
  def index
    @works = Work.ordered_works
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      flash.now[:failures] = "A problem occurred: Could not create #{@work.category}"
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
    @work = Work.find(params[:id])
    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      flash.now[:failures] = "A problem occurred: Could not update #{@work.category}"
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])
    flash[:success] = "Successfully destroyed"
    redirect_to root_path
  end

  def home
    @spotlight = Work.top_work
    @works = Work.ordered_works
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
