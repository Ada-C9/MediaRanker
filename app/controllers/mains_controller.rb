class MainsController < ApplicationController
  def index
    @albums = Work.all.where(category: "album").limit(2)
    @books = Work.all.where(category: "book").limit(2)
    @movies = Work.all.where(category: "movie").limit(2)
  end
end
