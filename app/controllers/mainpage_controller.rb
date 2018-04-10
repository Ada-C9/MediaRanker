class MainpageController < ApplicationController

  def index
    @top = Work.top_work
    @top_albums = Work.where(category_id: categorize('album')).first(10)
    @top_books = Work.where(category_id: categorize('book')).first(10)
    @top_movies = Work.where(category_id: categorize('movie')).first(10)
  end

  private

  def categorize(category)
    return Category.find_by(name: category).id
  end
end
