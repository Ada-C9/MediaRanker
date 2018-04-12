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
      redirect_to works_path
    else
      render :new
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

      # Materials commented out because we are now using strong params.
      # @book.update(title: params[:book][:title], author: params[:book][:author], description: params[:book][:description])

      if @work.update(work_params)
        redirect_to work_path(@work.id)
      else
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
      redirect_to works_path
    else
      render :destroy
    end
  end

  private

  def work_params
    params.require(:work).permit(:category, :creator, :title, :year_released, :description )
  end
end
