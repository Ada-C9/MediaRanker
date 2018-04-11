require "test_helper"

describe Work do
  describe "validations" do
    before do
      @work = Work.new
    end

    it "is valid when a work has a unique title " do
      title_ex = "coolbanana"
      @work.title = title_ex
      result = @work.valid?
      result.must_equal true
    end

    it "is invalid when a work does not have a title" do
      @work.title = nil
      result = @work.valid?
      result.must_equal false
    end

    it "is invalid when a work has a deplicate title" do
      work_dup = Work.last
      @work.title = work_dup.title
      result = @work.valid?
      result.must_equal false
    end
  end

  describe "relations" do
    before do
      @work = works(:one)
    end

    it "is valid when a work connects votes" do
      vote = Vote.first
      @work.votes << vote
      @work.vote_ids.must_include vote.id
    end
  end

  describe "self.show_spotlight" do
    it "can return the work with most votes" do
      result = Work.show_spotlight
      result.must_equal works(:two)
    end
  end

  describe "self.show_albums" do
    it "can return all albums from the works" do
      albums = Work.show_albums
      albums.each do |al|
        al.category.must_equal "album"
      end
    end
  end

  describe "self.show_books" do
    it "can turn all books from the works" do
      books = Work.show_books
      books.each do |book|
        book.category.must_equal "book"
      end
    end
  end

  describe "self.show_movies" do
    it "can return all movies from the works" do
      movies = Work.show_movies
      movies.each do |mov|
        mov.category.must_equal "movie"
      end
    end
  end
end
