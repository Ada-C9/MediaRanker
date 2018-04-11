class MainController < ApplicationController

  def index

    @media_spotlight = Work.first
    @top_ten_movies
    @top_ten_albums
    @top_ten_books
  end
end
