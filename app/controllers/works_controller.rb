class WorksController < ApplicationController
  before_action :works_all, only: [:index, :main]
  before_action :find_work, only: [:show, :edit, :update]

  def index
    # @works = Work.all
  end

  def main
    # @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def show
    # work_id = params[:id]
    #
    # @work = Work.find_by(id: work_id)
  end

  def edit
    # @work = Work.find(params[:id])
  end

  def update
    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])

    @work.delete
    flash[:success] = "Successfully destroyed #{@work.category} #{@work.id}"

    redirect_to root_path
  end


  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def works_all
    @works = Work.all
  end

  def find_work
    @work = Work.find(params[:id])
  end

end
