class WorksController < ApplicationController
  def edit
    @work = Work.find_by(id: params[:id])
  end

  def index
    @works = Work.all
  end

  def new
    @work = Work.all
  end

  def show
    @work = Work.find_by(id: params[:id])
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Media created"
      redirect_to works_path
    else
      flash.now[:alert] = @work.errors
      render :new
    end
  end

  def update
    @work = Work.find_by(id: params[:id])
    if @work.update(driver_params)
      flash[:success] = "#{work.category} updated"
      redirect_to work_path
    else
      render :edit
    end
  end

  def destroy
    begin
      @work = Work.find_by(id: params[:id])
      if @work != nil
        @work.destroy
      end
      flash[:success] = "#{work.category} deleted"
    rescue
      flash.now[:alert] = "Item does not exist"
    end
    redirect_to works_path
  end

  private

  def driver_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
