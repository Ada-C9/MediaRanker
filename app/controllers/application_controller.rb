class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_active_user

  def find_active_user
    @user = User.find_by(id: session[:user_id])
  end

  def sort_by_votes
    @media =[]
    # albums:
    albums = Work.where(category: "album")

    hasvote = []
    empty =[]
    albums.each {|album| album.votes.first != nil ? hasvote << album : empty << album}

    hasvote = (hasvote.sort_by {|album| album.votes.length}).reverse
    empty = empty.sort_by {|album| album.title}

    albums = hasvote.concat empty
    @media << albums

    # movies:
    movies = Work.where(category: "movie")

    hasvote = []
    empty =[]
    movies.each {|movie| movie.votes.first != nil ? hasvote << movie : empty << movie}

    hasvote = (hasvote.sort_by {|movie| movie.votes.length}).reverse
    empty = empty.sort_by {|movie| movie.title}

    movies = hasvote.concat empty
    @media << movies

    # books:
    books = Work.where(category: "book")

    hasvote = []
    empty =[]
    books.each {|book| book.votes.first != nil ? hasvote << book : empty << book}

    hasvote = (hasvote.sort_by {|book| book.votes.length}).reverse
    empty = empty.sort_by {|book| book.title}

    books = hasvote.concat empty
    @media << books

  end
end
