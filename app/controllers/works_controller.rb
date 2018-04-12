class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def home
    @top_albums = Work.top_works("album")
    @top_movies = Work.top_works("movie")
    @top_books = Work.top_works("book")
  end

  def index
    @works = Work.all
  end


  def show
    @user = User.find_by(id: session[:user_id] )
    # If we are in a nested route (/authors/7/books), we don't want @books to be Book.all, we want @books to just be the author's books
    if params[:author_id]
      author = Author.find_by(id: params[:author_id])
      @books = author.books
    else
      # we don't need to find a specific author's books, we just need to list all books
      @books = Book.all

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
      flash.now[:alert] = "A problem occurred: Could not create #{@work.category} #{@work.error}"
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
    redirect_to books_path
  end

  private
  def user_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description, :id, :votes)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end
end
