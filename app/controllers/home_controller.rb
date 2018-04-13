class HomeController < ApplicationController

  before_action :sort_by_votes

  def index
    @spotlight = Work.first
    # if top != nil
    #   top = @spotlight
    # end
    @albums = @media[0]
    @movies = @media[1]
    @books = @media[2]
  end
end
