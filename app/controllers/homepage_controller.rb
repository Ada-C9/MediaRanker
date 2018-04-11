class HomepageController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @works = Work.all
    @books = @works.where(category: "book")
    @albums = @works.where(category: "album")
    @movies = @works.where(category: "movie")
  end
end
