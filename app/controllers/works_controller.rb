class WorksController < ApplicationController
  def index
    @works = Work.all

    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create(work_params)
    if @work.save
      flash[:success] = "#{@work.title} created"
      redirect_to work_path(@work.id)
    else
      flash.now[:alert] = @work.errors
      render :new
    end
  end

  def show
    id = params[:id]
    @work = Work.find(id)
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)

  end
end
