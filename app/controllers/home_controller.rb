class HomeController < ApplicationController
  def index
    @media = Work.all

    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")
    @albums = Work.where(category: "album")
  end
end
