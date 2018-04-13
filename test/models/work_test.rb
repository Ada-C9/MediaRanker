require "test_helper"

describe Work do

  describe "validations" do

    before do
      @work = Work.create!(category: 'album', title: 'test title', creator: 'test creator', publication_year: 1999)
    end

    it "can be created with all required fields" do
      result = @work.valid?

      value(result).must_equal true
    end

    it "is invalid without a category" do
      @work.category = nil

      result = @work.valid?

      value(result).must_equal false
    end

    it "is invalid without a title" do
      @work.title = nil

      result = @work.valid?

      value(result).must_equal false
    end

    it "is invalid with a duplicate title and category" do
      duplicate_work = Work.new(category: 'album', title: 'test title', creator: 'another creator', publication_year: 2000)

      result = duplicate_work.valid?
      value(result).must_equal false
      duplicate_work.errors.messages.must_include :title, :creator
    end

    it "is valid with a duplicate title and different category" do
      duplicate_work = Work.new(category: 'book', title: 'test title', creator: 'another creator', publication_year: 2000)

      result = duplicate_work.valid?
      value(result).must_equal true
    end

    it "is invalid without a creator" do
      @work.creator = nil

      result = @work.valid?

      result.must_equal false
    end

    it "is invalid without a publication year" do
      @work.publication_year = nil

      result = @work.valid?

      result.must_equal false
    end

  end

  describe  "relationships" do

    before do
      @work = works(:album)
    end

    it "has many votes" do

      @work.votes.each do |vote|
        vote.must_be_kind_of Vote
      end

    end

    it "has a list of voting users" do

      @work.upvoted_users.each do |user|
        user.must_be_kind_of User
      end

    end

  end

  describe "self.order_albums" do

    it "returns a list of works with the category album" do
      album = works(:album)
      result = Work.order_albums

      result.must_include album
      result.length.must_equal 1
      result.each do |work|
        work.category.must_equal "album"
      end
    end
  end

  describe "self.order_books" do

    it "returns a list of works with the category book" do
      book = works(:book)
      result = Work.order_books

      result.must_include book
      result.length.must_equal 1
      result.each do |work|
        work.category.must_equal "book"
      end

    end

  end

  describe "self.order_movies" do

    it "returns a list of works with the category movie" do
      movie = works(:movie)
      result = Work.order_movies

      result.must_include movie
      result.length.must_equal 1
      result.each do |work|
        work.category.must_equal "movie"
      end

    end

  end

  describe "self.find_spotlight" do

    it "returns the work with the most overall votes" do
      album = works(:album)
      book = works(:book)
      movie = works(:movie)

      album.votes << Vote.new(user_id: users(:one).id)
      album.votes << Vote.new(user_id: users(:two).id)

      result = Work.find_spotlight

      result.must_equal album
    end

  end

end
