class HomepageController < ApplicationController
  def index
    works = Work.all
    @books = works.where(category: "book")
    @albums = works.where(category: "album")
    @movies = works.where(category: "movie")

    
  end
end
