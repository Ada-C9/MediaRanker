class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :upvote, :destroy]
  before_action :work_list, only: [:root, :index]
  # before_action :category_link_parser, only: [:index, :new, :create ]
  def root
    @spotlight = @works.spotlight
    @books = @works.top_ten("book")
    @albums = @works.top_ten("album")
    @movies = @works.top_ten("movie")
  end

  def index
    @books = @works.books
    @albums = @works.albums
    @movies = @works.movies
  end

  def new
    if @work_category
      redirect_to polymorphic_url(@work_category, new)
    else
      @work = Work.new
    end
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:status] = :success
      flash[:result_text] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to works_path
    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Could not create #{@work.category}"
      flash[:messages] = @work.errors.messages
      render :new, status: :bad_request
    end
  end

  def show; end

  def edit; end

  def update
    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      flash.now[:status] = :failure
      flash.now[:messages] = @work.errors.messages
      render :edit, status: :bad_request
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path
  end

  def upvote
    if session[:user_id]
      @current_user = User.where(id: session[:user_id]).first
      @vote = Vote.new(user: @current_user, work: @work)

      if @vote.save
        flash[:status] = :success
        flash[:result_text] = "Successfully upvoted #{@work.title}"

        case request.fullpath
        when "/works"
          redirect works_path
        when "/books"
          redirect books_path
        when "/albums"
          redirect albums_path
        when "/movies"
          redirect movies_path
        end
        redirect_back(fallback_location: work_path(@work))
      else
        flash[:status] = :failure
        flash[:result_text] = "Could not upvote"
        flash[:messages] = @vote.errors.messages
        redirect_back(fallback_location: work_path(@work))
      end
    else
      flash[:status] = :failure
      flash[:result_text]= "You must log in to do that"
      redirect_back(fallback_location: work_path(@work))
    end
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

  def work_list
    @works = Work.all
  end

  def category_link_parser
    @work = Work.find_by(id: params[:id])
    @work_category = @work.category.downcase.pluralize
  end
end
