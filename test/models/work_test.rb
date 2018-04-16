require "test_helper"

describe Work do
  describe "validations" do
    before do
      @work = Work.new(title: "Something Great", category: "album")
    end

    it "can be created with all required fields" do
      result = @work.valid?

      result.must_equal true
    end

    it "is invalid without a title" do
      @work.title = nil

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

    it "is invalid without a category" do
      @work.category = nil

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :category
    end

    it "is invalid with a duplicate title and category" do
      copy_work = Work.first
      @work.title = copy_work.title
      @work.category = copy_work.category

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

    it "can be created with duplicate title but different category" do
      copy_work = Work.first
      @work.title = copy_work.title
      @work.category = "movie"

      result = @work.valid?

      result.must_equal true
    end
  end

  describe "relations" do
    before do
      @work = Work.create!(title: "Something Great", category: "album")
    end

    it "connects votes and vote_ids" do
      vote = Vote.create!(user: User.first, work: @work)

      @work.votes.must_include vote
      @work.vote_ids.must_include vote.id
    end

    it "connects users and user_ids" do
      user = users(:patty)
      vote = Vote.create!(user: user, work: @work)

      @work.users.must_include user
      @work.user_ids.must_include user.id
    end
  end

  describe "ordered_exclusive method" do
    before do
      @voted_works = Work.ordered_exclusive
    end
    it "returns a collection of works with votes" do
      @voted_works.must_include works(:graceland)
      @voted_works.must_include works(:rhythm)
      @voted_works.map { |work| work.id }.count.must_equal 2
    end

    it "does not include works without votes" do
      @voted_works.wont_include works(:southeastern)
    end

    it "orders works from most votes to least votes" do
      @voted_works.first.must_equal works(:graceland)
      @voted_works.last.must_equal works(:rhythm)
    end

    it "returns an empty array if there are no works with votes" do
      Vote.all.each do |vote|
        vote.destroy
      end

      @voted_works.must_be_empty
    end

    it "returns an empty array if there are no works" do
      Work.all.each do |work|
        work.destroy
      end

      @voted_works.must_be_empty
    end
  end

  describe "ordered_inclusive method" do
    before do
      @works = Work.ordered_inclusive
    end

    it "returns a collection of all works" do
      @works.map { |work| work.id }.count.must_equal 11
    end

    it "includes works with and without votes" do
      @works.must_include works(:graceland)
      @works.must_include works(:southeastern)
    end

    it "orders works from most votes to least votes" do
      @works.first.must_equal works(:graceland)
      @works.last.votes.must_be_empty
    end

    it "returns an empty array if there are no works" do
      Work.all.each do |work|
        work.destroy
      end

      @works.must_be_empty
    end
  end

  describe "top_work method" do
    it "returns the work with the most votes" do
      Work.top_work.must_equal works(:graceland)
    end

    it "returns nil if there are no works with votes" do
      Vote.all.each do |vote|
        vote.destroy
      end

      Work.top_work.must_be_nil
    end

    it "returns nil if there are no works" do
      Work.all.each do |work|
        work.destroy
      end

      Work.top_work.must_be_nil
    end
  end

  describe "albums method" do
    it "returns a collection of works with category: album" do
      Work.albums.count.must_equal 4
      Work.albums.each do |work|
        work.category.must_equal "album"
      end
    end

    it "returns an empty array if there are no albums" do
      Work.where(category: :album).each do |work|
        work.destroy
      end

      Work.albums.must_be_empty
    end
  end

  describe "books method" do
    it "returns a collection of works with category: book" do
      Work.books.count.must_equal 4
      Work.books.each do |work|
        work.category.must_equal "book"
      end
    end

    it "returns an empty array if there are no books" do
      Work.where(category: :book).each do |work|
        work.destroy
      end

      Work.books.must_be_empty
    end
  end

  describe "movies method" do
    it "returns a collection of works with category: movie" do
      Work.movies.count.must_equal 3
      Work.movies.each do |work|
        work.category.must_equal "movie"
      end
    end

    it "returns an empty array if there are no movies" do
      Work.where(category: :movie).each do |work|
        work.destroy
      end

      Work.movies.must_be_empty
    end
  end

  describe "top_ten method" do
    it "returns the first ten works" do
      Work.top_ten.count.must_equal 10
    end

    it "returns an empty array if there are no works" do
      Work.all.each do |work|
        work.destroy
      end

      Work.top_ten.must_be_empty
    end
  end
end
