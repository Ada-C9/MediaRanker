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

    it "is invalid with a duplicate title" do
      dup_work = Work.new(title: @work.title)

      result = dup_work.valid?

      result.must_equal false
      dup_work.errors.messages.must_include :title
    end
  end

  describe "relations" do
    before do
      @work = Work.new(title: 'test work')
    end

    # votes
    it "connects works and vote_ids" do
      # Arrange
      vote = Vote.first

      # Act
      @work.votes << vote

      # Assert
      @work.vote_ids.must_include vote.id
    end
  end

  describe "model methods" do
    it "find top_work" do
      user1 = users(:mambo)
      user2 = users(:tango)
      user3 = users(:mark)
      vote1 = Vote.create(work: works(:WW), user: user1)
      vote2 = Vote.create(work: works(:WW), user: user2)
      vote3 = Vote.create(work: works(:HP), user: user3)

      Work.top_work.title.must_equal works(:WW).title
    end
  end

end
