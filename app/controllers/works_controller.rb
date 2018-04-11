class WorksController < ApplicationController

  def index
    @albums = Work.where(category: "album")
    @books  = Work.where(category: "book")
    @movies = Work.where(category: "movie")
  end

  def show
    @work = Work.find_by(id: params[:id].to_i )
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.id != nil
      flash[:success] = "Succesfully added #{@work.category} #{@work.id}"
      redirect_to root_path
    else
      flash.now[:failure] = "Could not add work"
      render :new
    end
  end

  def edit
  @work = Work.find_by(id: params[:id].to_i)
  end

  def update
  end

  def destroy
    @work = Work.find_by(id: params[:id].to_i)
    @work.destroy
    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
