class WorksController < ApplicationController
  before_action :find_work, only: [:edit, :show, :update, :destroy]

  def edit
  end

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def show
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Item added!"
      redirect_to works_path
    else
      flash.now[:alert] = @work.errors
      render :new
    end
  end

  def update
    if @work.update(work_params)
      flash[:success] = "#{@work.category.capitalize} updated!"
      redirect_to work_path
    else
      render :edit
    end
  end

  def destroy
    if @work != nil
      @work.destroy
      flash[:success] = "#{@work.category.capitalize} deleted!"
    else
      flash.now[:alert] = "Item does not exist!"
    end
    redirect_to root_path
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end
end
