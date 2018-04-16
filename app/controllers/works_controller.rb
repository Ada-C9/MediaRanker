class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update]

  def index
    @movies = Work.all_movies
    @books = Work.all_books
    @albums = Work.all_albums
  end

  def show; end

  def edit; end

  def update
    work = Work.find(params[:id])

    work.assign_attributes(work_params)

    if work.save
      redirect_to work_path(work)
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:status] = :success
      flash[:message] = "Successfully created #{@work.category}"
      redirect_to work_path(@work.id)
    else
      flash.now[:status] = :failure
      flash.now[:message] = "A problem occurred: Could not create #{@work.category.present? ? @work.category : 'work'}"
      flash.now[:errors] = @work.errors.messages
      render :new
    end
  end

  def destroy
    if Work.destroy(params[:id])
      redirect_to works_path
    end
  end

  def upvote

    if @current_user.nil?
      flash.now[:status] = :failure
      flash.now[:message] = "You must log in to do that"
      @work = Work.find(vote_params[:work_id])
      render :show
      return
    end

    @vote = Vote.new

    @vote[:user_id] = @current_user.id
    @vote[:work_id] = vote_params[:work_id]

    if @vote.save
      flash[:status] = :success
      flash[:message] = "You successfully upvoted #{@vote.work.title}"

    else

      flash[:status] = :failure
      flash[:message] = "You can't upvote #{@vote.work.title}"
      flash[:errors] = @vote.errors.messages
    end

    @work = @vote.work
    redirect_to work_path(@work)

  end

private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find(params[:id])
  end

  def vote_params
    return params.permit(:work_id)
  end

end
