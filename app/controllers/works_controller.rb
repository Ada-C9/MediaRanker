class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def show
    id = params[:id]
    @work = Work.find(id)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save #it worked
      flash[:success] = "#{@work.title} succesfully created!"
    else
      flash.now[:alert] = @work.errors
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      redirect_to works_path
    end
  end

  def update
    @work = Work.find_by(id: params[:id])
    if !@work.nil?
      if @work.update(work_params)
        flash[:success] = "#{@work.title} succesfully edited!"
      else
        flash.now[:alert] = @work.errors
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    id = params[:id]
    @work = Work.find(id)
    if @work.destroy #it worked
      flash[:success] = "#{@work.title} deleted"
    else
      flash.now[:alert] = @work.errors
      render :destroy
    end
  end

  private

  def work_params
    params.require(:work).permit(:category, :creator, :title, :year_released, :description )
  end
end
