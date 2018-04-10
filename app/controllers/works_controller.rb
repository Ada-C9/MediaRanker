class WorksController < ApplicationController

  def index
    @top_albums = Work.where(category_id: categorize('album'))
    @top_books = Work.where(category_id: categorize('book'))
    @top_movies = Work.where(category_id: categorize('movie'))
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    work_id = params[:id]

    @work = Work.find(work_id)
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
  end

  def upvote
  end

  private

  def categorize(category)
    return Category.find_by(name: category).id
  end

  def work_params
    return params.require(:work).permit(:title, :category, :creator, :publication_year, :description)
  end
end
