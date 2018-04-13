class WelcomesController < ApplicationController
  def index
    @works = Work.all

    @media_spotlight = Work.media_spotlight

    @albums = Work.top_ten("album")
    @books = Work.top_ten("book")
    @movies = Work.top_ten("movie")
  end
end
