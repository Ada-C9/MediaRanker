class WelcomesController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    @top_work = Work.top_1

    @albums = Work.top_10("album")
    @books = Work.top_10("book")
    @movies = Work.top_10("movie")
  end
end
