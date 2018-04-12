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

end
