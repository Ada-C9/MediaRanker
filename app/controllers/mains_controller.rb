class MainsController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    @albums = Work.all.where(category: "album").limit(10)
    @books = Work.all.where(category: "book").limit(10)
    @movies = Work.all.where(category: "movie").limit(10)
  end
end
