class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.all.most_voted
    @categories = Category.all
  end

  def new
    @work = Work.new
    @categories = Category.all
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "Successfully created #{@work.category.name} #{@work.id}"
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @work.update_attributes(work_params)

    if @work.save
      flash[:success] = "Successfully created #{@work.category.name} #{@work.category.id}"
      redirect_to work_path(@work)
    else
      render :edit
    end

  end

  def destroy
    @work.deactivate
    @work.destroy
    flash[:success] = "Successfully destroyed album 411"
    redirect_to root_path
  end

  def top
    @top = Work.top(1).first
    @works = Work.all
    @categories = Category.all.reverse
  end

  private

  def work_params
    return params.require(:work).permit(:category_id, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find(params[:id])
  end

end
