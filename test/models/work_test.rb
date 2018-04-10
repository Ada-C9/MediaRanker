require "test_helper"

describe Work do

  describe "validations" do

    before do
      @work = Work.new(category: 'album', title: 'test title', creator: 'test creator', publication_year: 'test year')
    end

    it "can be created with all required fields" do
      result = @work.valid?

      result.must_equal true
    end

    it "is invalid without a category" do
      @work.category = nil

      result = @work.valid?

      result.must_equal false
    end

    it "is invalid without a title" do
      @work.title = nil

      result = @work.valid?

      result.must_equal false
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

end
