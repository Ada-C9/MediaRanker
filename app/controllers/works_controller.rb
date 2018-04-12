class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:index, :show, :new, :edit]

  def index
    @albums = Work.sorted_list("album")
    @books = Work.sorted_list("book")
    @movies = Work.sorted_list("movie")
  end

  def show
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

  def edit
  end

  def update
    if !@work.nil?
      if @work.update(work_params)
        flash[:success] = "Successfully updated #{@work.category} #{@work.id}"
        redirect_to work_path
      else
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    if @work
      @work.destroy
      flash[:success] = "Successfully destroyed #{@work.category} #{@work.id}"
    end
    redirect_to mains_path
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end
end
