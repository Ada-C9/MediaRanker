class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update]

  def index
    @works = Work.top_ten
    @categories = Category.all
  end

  def new
    @work = Work.new
    @categories = Category.all
  end

  def create
    @work = Work.new(work_params)
    @category = Category.find(params[:work][:category])

    if @work.save
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update

  end

  def destroy

  end

  def top
    @works = Work.all
    @categories = Category.all
  end

  private

  def work_params
    return params.require(:work).permit(:category_id, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find(params[:id])
  end

end
