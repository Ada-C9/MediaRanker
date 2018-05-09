require "test_helper"

describe Work do
  describe 'validations' do
    let(:work) { Work.new(category:"movie", title: "Pee-Wee's Big Adventure") }

    it "must be valid" do
      value(work).must_be :valid?
    end

    it "must be invalid without a category" do
      work.category = nil
      value(work).wont_be :valid?
    end

    it "must be invalid without a title" do
      work.title = nil
      value(work).wont_be :valid?
    end

    it "must be valid with a supported category type" do
      categories = ["movie", "book", "album"]
      categories.each do |cat|
        work.category = cat
        value(work).must_be :valid?
      end
    end

    it "must be invalid without a supported category type" do
      work.category = "literally a bunch of junk"
      value(work).wont_be :valid?
    end
  end

  describe 'self methods' do
    it 'returns an array of works by category sorted by vote count in reverse' do
      # testing albums
      work_albums = Work.albums
      top_album = work_albums.first.votes.count
      bottom_album = work_albums.last.votes.count
      mid_album = work_albums[work_albums.length/2].votes.count

      top_album.must_be :>=, mid_album
      mid_album.must_be :>=, bottom_album

      # testing movies
      work_movies = Work.movies
      top_movie = work_movies.first.votes.count
      bottom_movie = work_movies.last.votes.count
      mid_movie = work_movies[work_movies.length/2].votes.count

      top_movie.must_be :>=, mid_movie
      mid_movie.must_be :>=, bottom_movie

      # testing books
      work_books = Work.books
      top_book = work_books.first.votes.count
      bottom_book = work_books.last.votes.count
      mid_book = work_books[work_books.length/2].votes.count

      top_book.must_be :>=, mid_book
      mid_book.must_be :>=, bottom_book
    end
  end

  describe 'top ten methods' do
    it 'returns the top ten works in each category' do
      # testing albums
      top_albums = Work.top_albums
      top_albums.length.wont_be :>, 10
      highest_votes = top_albums.first.votes.count
      lowest_votes = top_albums.last.votes.count
      highest_votes.must_be :>=, lowest_votes

      # testing movies
      top_movies = Work.top_movies
      top_movies.length.wont_be :>, 10
      highest_votes = top_movies.first.votes.count
      lowest_votes = top_movies.last.votes.count
      highest_votes.must_be :>=, lowest_votes

      # testing books
      top_books = Work.top_books
      top_books.length.wont_be :>, 10
      highest_votes = top_books.first.votes.count
      lowest_votes = top_books.last.votes.count
      highest_votes.must_be :>=, lowest_votes
    end
  end

  describe 'spotlight method' do
    it 'showcases the work with most votes' do
      highest_votes = Work.all.sort_by { |item| item.votes.count }.reverse.first

      spotlight = Work.spotlight
      spotlight.must_equal highest_votes
    end
  end

end
