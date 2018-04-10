class WorksController < ApplicationController
  def index
    works = Work.all
    @albums = works.where(category: 'album')
    @books = works.where(category: 'book')
    @movies = works.where(category: 'movie')
  end

  def show
    @work = Work.find(params[:id])
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
      # include error messages
      flash.now[:failure] = "A problem occurred: Could not create #{@work.category}"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def work_params
    return params.require(:work).permit(:title, :creator, :publication_year, :category, :description)
  end
end
