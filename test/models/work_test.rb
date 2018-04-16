require "test_helper"

describe Work do

  describe 'validations' do
    before do
      @work = Work.new(category: 'movie', title: 'test title', creator: 'test creator', publication_year: 2018, description: 'test description' )
    end

    it 'is valid when all fields are present' do
      result = @work.valid?
      result.must_equal true
    end

    it 'is invalid without a category' do
      @work.category = nil
      result = @work.valid?
      result.must_equal false
      @work.errors.messages.must_include :category
    end

    it 'is invalid without a title' do
      @work.title = nil
      result = @work.valid?
      result.must_equal false
      @work.errors.messages.must_include :title
    end
  end

  describe 'relations' do

    it 'has many votes' do
      work = works(:black_panther)
      work.votes.length.must_equal 3
      work.votes.must_include votes(:movie_vote)
      work.votes.must_include votes(:second_movie)
      work.votes.must_include votes(:third_movie)
    end

    it 'has many users through votes' do
      work = works(:black_panther)
      work.users.length.must_equal 3
      work.users.must_include users(:luke)
      work.users.must_include users(:samuel)
      work.users.must_include users(:moises)
    end

  end

  describe 'all movies' do
    before do
      @all_movies = Work.all_movies
    end

    it 'returns all movies' do
      test_movies = Work.where(category: "movie")
      @all_movies.must_equal test_movies
    end

    it 'returns some of the expected movies' do
      @all_movies.include?(works(:black_panther)).must_equal true
      @all_movies.include?(works(:citizen_kane)).must_equal true
      @all_movies.include?(works(:get_out)).must_equal true
    end

  end

  describe 'all books' do
    before do
      @all_books = Work.all_books
    end

    it 'returns all books' do
      test_books = Work.where(category: "book")
      @all_books.must_equal test_books
    end

    it 'returns some of the expected books' do
      @all_books.include?(works(:kindred)).must_equal true
      @all_books.include?(works(:bloodchild)).must_equal true
    end

  end

  describe 'all music' do
    before do
      @all_albums = Work.all_albums
    end

    it 'returns all albums' do
      test_albums = Work.where(category: "album")
      @all_albums.must_equal test_albums
    end

    it 'returns some of the expected albums' do
      @all_albums.include?(works(:blueprint)).must_equal true
      @all_albums.include?(works(:american_teen)).must_equal true
    end

  end

  describe 'media spotlight' do

    it 'returns top work' do
      all_works = Work.all
      media_spotlight = Work.media_spotlight

      # does same thing as media_spotlight but in less optimized way
      expected = Work.all.sort_by{ |w| w.votes.count }.last

      media_spotlight.must_equal works(:kindred)
      media_spotlight.must_equal expected
    end

  end

end
