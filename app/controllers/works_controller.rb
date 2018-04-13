class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.all
    # @movies = Work.where(category: "movie")
    # @books = Work.where(category: "book")
    # @albums = Work.where(category: "album")
    @movies = Work.ordered_by_votes_works("movie")
    @books = Work.ordered_by_votes_works("book")
    @albums = Work.ordered_by_votes_works("album")
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
    if !@work.nil?
      if @work.update(work_params)
        redirect_to work_path(@work.id)
      else
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    if @work
      @work.votes.each do |vote|
        vote.destroy
      end
      @work.destroy
      flash[:sucess] = "#{@work.title} deleted"
    else
      flash[:alert] = "Work does not exist"
    end
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
