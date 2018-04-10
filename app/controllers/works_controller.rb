class WorksController < ApplicationController
  def index
    # @media = Work.all

    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")
    @albums = Work.where(category: "album")
  end

  def show
    id = params[:id]
    @work = Work.find(id)
  end

  def new
    @work = Work.new()
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:sucess] = "#{@work.title} saved"
      redirect_to works_path
    else
      flash.now[:alert] = "Media was not save."
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
