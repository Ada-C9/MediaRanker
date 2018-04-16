class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update, :destroy]
  before_action :find_user

  def index
    @albums = Work.where(work_category: 'album').by_votes
    @books = Work.where(work_category: 'book').by_votes
    @movies = Work.where(work_category: 'movie').by_votes
  end

  def welcome
    @spotlight = Work.all.get_spotlight
    @albums = Work.where(work_category: 'album').top_ten
    @books = Work.where(work_category: 'book').top_ten
    @movies = Work.where(work_category: 'movie').top_ten
  end

  def show
    @works = Work.all.order(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Successfully created #{@work.work_category} #{@work.id} "
      redirect_to work_path(@work.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @work = Work.find_by(id: params[:id])
    if !@work.nil?
      flash[:success] = "Successfully updated #{@work.work_category} #{@work.id} "
      @work.update(work_params) ? (redirect_to work_path(@work.id)) :
      (render :edit)
    else
      redirect_to works_path
    end
  end

  def destroy
    Work.all.find(params[:id]).destroy
    flash[:success] = "Successfully destroyed #{@work.work_category} #{@work.id} "
    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:work_title, :work_creator, :work_description, :work_category,
      :work_publication_year)
    end

    def find_work
      @work = Work.find_by id: params[:id]
    end

  end
