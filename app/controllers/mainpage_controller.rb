class MainpageController < ApplicationController

  def index
    @top_albums = Work.where(category_id: categorize('album'))
    @top_books = Work.where(category_id: categorize('book'))
    @top_movies = Work.where(category_id: categorize('movie'))
  end

  private

  def categorize(category)
    return Category.find_by(name: category).id
  end
end
