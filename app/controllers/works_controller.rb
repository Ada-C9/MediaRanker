class WorksController < ApplicationController
  def root
    works = Work.all
    @spotlight = works.spotlight
    @books = works.top_ten("book")
    @albums = works.top_ten("album")
    @movies = works.top_ten("movie")
  end

  def index
    @works = Work.all
    @books = @works.books
    @albums = @works.albums
    @movies = @works.movies
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to works_path
    else
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  def upvote
    @work = Work.find(params[:id])
    # @current_user = User.find_by(id: session[:user_id])

    if session[:user_id]
      @current_user = User.where(id: session[:user_id]).first

      @vote = Vote.new(user: @current_user, work: @work)
      if @vote.save
        flash.notice = "Successfully upvoted #{@work.title}"
        redirect_to root_path
      else
        flash.now[:notice] = "Could not upvote"
        render :show
        # flash[:messages] =
      end
    else
      flash.alert = "You must log in to do that"
    end
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
