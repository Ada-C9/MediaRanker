class HomeController < ApplicationController
  include HomeHelper

  def index
    @spotlight = Work.media_spotlight
    @top_m = Work.top_movies
    @top_b = Work.top_books
    @top_a = Work.top_albums
  end

end
