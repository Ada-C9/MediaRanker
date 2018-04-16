class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @works = Work.all
    @albums = @works.where(category: "album")
    @books = @works.where(category: "book")
    @movies = @works.where(category: "movie")
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
  end

  def show
    if @work == nil
      redirect_to "/404.html"
    end
  end

  def edit
  end

  def update
    @work.update(work_params)
  end

  def destroy
    @work.destroy
    redirect_to root_path
  end

  def upvote
    if session[:user] == nil
      flash[:alert] = "You must be logged in to vote."

      redirect_back(fallback_location: root_path)
    else
      @vote = Vote.new
      @vote.user_id = session[:user]["id"]
      @vote.work_id = params[:id]
      if @vote.save
        redirect_back(fallback_location: root_path)
        flash[:success] = "Successfully upvoted!"
      else
        redirect_back(fallback_location: root_path)
        flash[:alert] = @vote.errors
      end
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :creator, :publication_date, :description, :category)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end
end
