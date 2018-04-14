class HomeController < ApplicationController


  def index
    @spotlight = Work.spotlight
    # if top != nil
    #   top = @spotlight
    # end
    work = Work.all
    @albums = work.sorted_list("album")
    @movies = work.sorted_list("movie")
    @books = work.sorted_list("book")
  end
end
