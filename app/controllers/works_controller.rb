class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.all
    # @movies = Work.where(category: "movie")
    # @books = Work.where(category: "book")
    # @albums = Work.where(category: "album")
  end

  def new
    @work = Work.new
  end

  def show

  end

  def edit

  end

  def create
    @work = Work.create(work_params)
    if @work.save
      flash[:success] = "#{@work.title} Created"
      redirect_to work_path(@work.id)
    else
      flash.now[:alert] = @work.errors
      render :new
    end
  end

  def update
  end

  def destroy

    @work.destroy
    redirect_to works_path
  end

  private
    def work_params
      return params.require(:work).permit(:title, :category, :creator, :publication_year, :description)
    end

    def find_work
      @work = Work.find_by(id: params[:id])
    end


end
