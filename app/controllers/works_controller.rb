class WorksController < ApplicationController
  # nic, used
  # raise params.inspect to view params output
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      # redirect_to '/books'
      flash[:success] = "Work added successfully"
      redirect_to works_path
    else
      flash.now[:failure] = "Failed to create work"
      render :new
    end
  end

  def top_media
    @top_medium = Work.spotlight_work
    @top_albums = Work.top_albums
    @top_movies = Work.top_movies
    @top_books = Work.top_books

    raise
  end


  def show
    work_id = params[:id]
    @work =  Work.find(work_id)
  end

  def update
    @work = Work.find(params[:id])

    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(work)
    else
      render :edit
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to works_path
  end

  private
  def work_params
    params.require(:work).permit(:title, :created_by, :publication_date, :description, :category)
  end

end
