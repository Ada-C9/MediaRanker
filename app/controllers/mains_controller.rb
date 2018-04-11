class MainsController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    @albums = Work.all.where(category: "album").limit(10).to_a
    @albums.sort_by! { |album| -album.total_votes }

    @books = Work.all.where(category: "book").limit(10).to_a
    @books.sort_by! { |book| -book.total_votes }

    @movies = Work.all.where(category: "movie").limit(10).to_a
    @movies.sort_by! { |movie| -movie.total_votes }
  end
end
