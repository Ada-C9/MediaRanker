class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    # @work.published.to_i
    if @work.save
      # flash[:success] = "Work Created"
      redirect_to works_path
    else
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    if !@work.nil?
      if @work.update(work_params)
        # flash[:success] = "#{@work.title} updated"
        redirect_to work_path(@work.id)
      else
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def show
    @work = Work.find_by(id: params[:id])
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    if @work
      @work.destroy
    end
    # flash[:success] = "#{@work.title} deleted"
    redirect_to works_path
  end

  def upvote
  end

  private

  def work_params
    return params.require(:work).permit(:title, :description, :creator, :published, :category)
  end
end
