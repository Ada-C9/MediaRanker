class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.published.to_i
    if @work.save
      flash[:success] = "Work Created"
      redirect_to works_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @work = Work.find_by(id: params[:id])
  end

  def destroy
  end

  def upvote
  end

  private

  def work_params
    return params.require(:work).permit(:title, :description, :creator, :published, :category)
  end
end
