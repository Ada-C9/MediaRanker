require "test_helper"

describe Work do
  describe "validations" do
    # all validations pass
    before do
      # Arrange
      # We need an author for a book, so add one to the
      # test DB. Use create! to fail fast - we aren't
      # interested in the author, but we need our
      # tests to be invalid if we can't have one

      # There are a variety of ways to access fixture data
      # author = Author.find_by(name: "Sandi Metz")
      # author = authors(:metz)
      #author = Author.first

      # IDs are assigned at random, so this will not work
      # Author.find(3)

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

    end
  end
end
