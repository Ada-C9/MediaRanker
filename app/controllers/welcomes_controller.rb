class WelcomesController < ApplicationController


  def index

    @spotlight_work = Work.best_work

    @movies = Work.top_ten("movie")
    @books = Work.top_ten("book")
    @albums = Work.top_ten("album")

  end
end
