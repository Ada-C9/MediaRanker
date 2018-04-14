class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]

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
    @vote = Vote.new
    @vote.user = User.find(session[:user_id])
    @vote.work = Work.find_by(id: params[:id])

    if @vote.save
      redirect_to root_path
      flash[:success] = "Successfully upvoted!"
    else
      flash.now[:alert] = @vote.errors
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
