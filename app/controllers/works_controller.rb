class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]
  before_action :find_active_user
  # before_action :find_user
  def index
    # @media = Work.all

    # albums:
    albums = Work.where(category: "album")

    hasvote = []
    empty =[]
    albums.each do |album|
      album.votes.first != nil ? hasvote << album : empty << album
    end

    hasvote = (hasvote.sort_by {|album| album.votes.length}).reverse
    empty = empty.sort_by {|album| album.title}

    @albums = hasvote.concat empty

    # movies:
    movies = Work.where(category: "movie")

    hasvote = []
    empty =[]
    movies.each do |movie|
      movie.votes.first != nil ? hasvote << movie : empty << movie
    end

    hasvote = (hasvote.sort_by {|movie| movie.votes.length}).reverse
    empty = empty.sort_by {|movie| movie.title}

    @movies = hasvote.concat empty

    # books:
    books = Work.where(category: "book")

    hasvote = []
    empty =[]
    books.each do |book|
      book.votes.first != nil ? hasvote << book : empty << book
    end

    hasvote = (hasvote.sort_by {|book| book.votes.length}).reverse
    empty = empty.sort_by {|book| book.title}

    @books = hasvote.concat empty

  end

  def show
    # id = params[:id]
    # @work = Work.find(id)
    #  no need for it anymore since added controller filter
  end

  def new
    @work = Work.new()
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:sucess] = "#{@work.title} saved"
      redirect_to works_path
    else
      flash.now[:alert] = "Media was not save."
      render :new
    end
  end

  def edit
    # @work = Work.find_by(id: params[:id])
  end

  def update
    # @work = Work.find_by(id: params[:id])
    if !@work.nil?
      if @work.update(work_params)
        flash[:sucess] = "Successfully updated #{@work.category} #{@work.title}"
        redirect_to work_path(@work.id)
      else
        flash.now[:alert] = "Media was not save."
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
      flash[:sucess] = "Successfully destroyed #{@work.category} #{@work.title} "
    else
      flash[:alert] = "Work does not exist"
    end
    redirect_to root_path
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    # a method to DRY other methods
    # see line with before_action at top of file.
    @work = Work.find_by_id(params[:id])
  end

end
