class TopTensController < ApplicationController
  def index
    works = Work.all

    # order works by vote count
    movies = works.where(category: "movie")
    books = works.where(category: "book")
    albums = works.where(category: "album")

    @top_movies = (movies[0..9].sort_by { |work| work.votes.count }).reverse!
    @top_books = (books[0..9].sort_by { |work| work.votes.count }).reverse!
    @top_albums = (albums[0..9].sort_by { |work| work.votes.count }).reverse!

    @top_work = (works.sort_by { |work| work.votes.count }).last
  end
end
