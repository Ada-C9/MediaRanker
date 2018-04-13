
class WorksController < ApplicationController

  before_action :find_work, only: [:edit, :show, :update, :destroy]
  before_action :logged_in, only: [:edit,:update, :new, :create, :destroy]

  def index
    @works = Work.all
    @top_books = Work.top_ten_books
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "#{@work[:category]} Created"
      redirect_to root_path
    else
      flash.now[:alert] = @work.errors

      render :new
    end
  end

  def new
    @work = Work.new
  end

  def edit
  end

  def show
  end

  def update
    if @work
      if @work.update(work_params)
        flash[:success] = "#{@work.title} updated"
        redirect_to work_path(@work.id)
      else
        flash.now[:alert] = "Failed to update"
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    if @work
      @work.destroy
      flash[:success] = "Work Deleted"
    else
      flash[:alert] = "Work does not exist"
    end
    redirect_to works_path

  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description, votes: [])
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end

end
