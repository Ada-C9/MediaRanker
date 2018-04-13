class HomesController < ApplicationController
  def index
    @top_work = Work.top_overall
    @albums = Work.top('album')
    @books = Work.top('book')
    @movies = Work.top('movie')
  end

end
