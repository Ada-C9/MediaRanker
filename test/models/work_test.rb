require "test_helper"

describe Work do

  describe "Validations" do
    before do
      @work = Work.first
    end

    it "can be created with all required fields" do
      # Act
      result = @work.valid?

      # Assert
      result.must_equal true
    end

    it "must be invalid without a category" do
      @work.category = nil

      value(@work).wont_be :valid?
    end

    it "must be invalid without a title" do
      @work.title = nil

      value(@work).wont_be :valid?
    end

    it "must be valid with a supported category type" do
      categories = ["movie", "book", "album"]
      categories.each do |cat|
        @work.category = cat
        value(@work).must_be :valid?
      end
    end

    it "must be invalid without a supported category type" do
      @work.category = "literally a bunch of junk"

      value(@work).wont_be :valid?
    end
  end


  describe "relations" do
    before do
      @work = Work.new(title: 'test work')
    end

    # votes
    it "connects votes and vote_ids" do
      # Arrange
      vote = Vote.first

      # Act
      @work.votes << vote

      # Assert
      @work.vote_ids.must_include vote.id
    end

  end
end
