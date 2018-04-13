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

    it "requires a unique title" do
      title = "My Test Book"
      work = Work.create!(title: title)
      work2 = Work.new(title: title)
      work2.wont_be :valid?

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

  describe "custom methods" do
    it "finds the work with more votes" do

    end

    it "finds the top ten albums" do
    end

    it "finds the top ten movies" do
    end

    it "find the top ten books" do
    end

    it "no models with category" do

    end

    it "if there is a tie" do
      
    end

  end
end
