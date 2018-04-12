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
    if @work.save
      flash[:success] = "Succesfully added #{@work.category} #{@work.title}"
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
    @work = Work.find_by(id: params[:id].to_i)
    if !@work.nil?
      if @work.update(work_params)
        flash[:success] = "Work added category #{@work.category} #{@work.title}"
        redirect_to work_path
      else
        flash[:notice] = "A problem occurred: Could not update work"
        flash.now[:alert] = @work.errors
        render :edit
      end
    else
      redirect_to works_path
    end
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
