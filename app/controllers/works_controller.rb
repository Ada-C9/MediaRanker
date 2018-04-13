class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  before_action :find_user

  def home
    @top_albums = Work.top_works("album")
    @top_movies = Work.top_works("movie")
    @top_books = Work.top_works("book")

    # this is temporary until highest votes is calculated
    @spotlight = Work.first
  end

  def index
    @albums = Work.all_works("album")
    @movies = Work.all_works("movie")
    @books = Work.all_works("book")
  end

  def show
    if @work
      @creation = "Created by: #{@work.creator}"
      @publish = "Published: #{@work.publication_year}"
      @describe = @work.description
    else
      flash[:fail] = "Unable to find work"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if !@work.nil?
      if @work.update(work_params)
        redirect_to work_path(@work.id)
      else
        #Flash or
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to root_path
    else
      # this feels wrong, I am unsure of the @work.error
      flash.now[:alert] = "A problem occurred: Could not create #{@work.category} #{@work.errors}"
      render :new
    end
  end

  def destroy
    if @work
      @work.destroy
      flash[:success] = "Sucessfully destroyed #{@work.category} #{@work.id}"

      # there was no flash if I deleted an item that has already been deleted.
    else
      # flash[:alert] = {book: "Book does not exist"}
    end
    redirect_to root_path
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description, :id, :votes)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end
end
