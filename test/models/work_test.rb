require "test_helper"

describe Work do

  describe "validations" do
    it "can be created with all fields" do
      work = works(:best_movie)
      result = work.valid?
      result.must_equal true
    end

    it "must have a title" do
      work = works(:best_album)
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :title
    end

    it "must have a category" do
      work = works(:best_book)
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :category
    end

    it "must have a publication_year" do
      work = works(:watch_worthy)
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :publication_year
    end

    it "must have a creator" do
      work = works(:must_book)
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :creator
    end
  end

  describe "relations" do
    it "must have votes" do
        work = works(:best_movie)
        work.votes.count.must_equal 1
      end

    it "does not have votes" do
      work = works(:watch_worthy)
      work.votes.count.must_equal 0
    end
   end
end
