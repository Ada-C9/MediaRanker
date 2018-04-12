class WelcomeController < ApplicationController
  before_action :find_user

  def index
    @spotlight = Work.top(1)[0]
    @albums = Work.top(10, "album")
    @books = Work.top(10, "book")
    @movies = Work.top(10, "movie")
  end
end
