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
  end

  def show
  end

  def edit
    work_id = params[:id]

    @work = Work.find(work_id)
  end

  def update
  end

  def destroy
  end

  def upvote
  end

  private

  def categorize(category)
    return Category.find_by(name: category).id
  end
end
