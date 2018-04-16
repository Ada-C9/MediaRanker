class HomepageController < ApplicationController
  def index
    @books = Work.order_works("book")[0 .. 10]
    @albums = Work.order_works("album")[0 .. 10]
    @movies = Work.order_works("movie")[0 .. 10]
    # raise
  end
end
