require "test_helper"

describe Work do
  let(:work) { Work.new category: "movie", title: "hello", creator: "Jane" }

  describe "validations" do
    it "must be valid" do
      value(work).must_be :valid?
    end

    it "must have a category" do
      work.category = nil

      work.valid?.must_equal false
      work.errors.must_include :category

    end

    it "must have a title" do
      work.title = nil

      work.valid?.must_equal false
      work.errors.must_include :title
    end

    it "must raise error for short title" do
      work.title = ""

      work.valid?.must_equal false
      work.errors.must_include :title
    end

    it "must raise error for overly-long title" do
      test_title = []
      30.times do |i|
        test_title << i
      end
      test_title = test_title.join

      work.title = test_title

      work.valid?.must_equal false
      work.errors.must_include :title
    end
  end

  describe "relations" do
    it "has votes" do
      one = Vote.create(user_id: 1, work_id: work.id)
      two = Vote.create(user_id: 1, work_id: work.id)

      work.valid?.must_equal true
      one.work_id.must_equal work.id
      two.work_id.must_equal work.id
    end
  end

end
