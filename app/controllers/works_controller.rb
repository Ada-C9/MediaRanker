class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.all
    @albums = Work.where(category: "album").sort_by {|work| work.votes.count }.reverse
    @books = Work.where(category: "book").sort_by {|work| work.votes.count }.reverse
    @movies = Work.where(category: "movie").sort_by {|work| work.votes.count }.reverse
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def edit;end


  def update

    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render :edit
    end

  end

  def show;end

  def destroy
    @work.destroy
    flash[:sucess] = "Successfully destroyed"
    redirect_to works_path
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
    unless @work
      head :not_found
    end
  end


end
