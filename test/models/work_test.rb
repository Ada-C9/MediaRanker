require "test_helper"

describe Work do
  describe "validations" do

    before  do
      category = Category.first
      @work = Work.new(category: category, title: "Test Title")
    end

    it "can be created with all attributes" do
      result = @work.valid?

      result.must_equal true
    end

    it "is invalid without a title" do
      @work.title = nil

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

    it "is invalid with a duplicate title" do
      title = "duplicate"
      @work.title = title
      @work.save

      second_work = Work.new(category: Category.first, title: title)

      result = second_work.valid?
      result.must_equal false
      second_work.errors.messages.must_include :title
    end

  end

  describe "relations" do
    it "connects category and category_id" do
      category = Category.first
      work = Work.new(category: category)

      work.category_id.must_equal category.id
    end

  end

  describe "self.top" do

    it "returns a collection" do
      result = Work.top(2)
      result.must_be_kind_of Array
    end

    it "raises an error without an argument" do
      proc {
        Work.top
      }.must_raise ArgumentError

    end

    it "is has a count that matches the argument" do
      expected_count = 3
      result = Work.top(expected_count)
      result.count.must_equal expected_count
    end

    it "it returns a smaller collection if the argument is bigger than the number of works available" do
      result = Work.top(78)
      result.must_be_kind_of Array
    end
  end

  describe "#deactivate" do
    it "destroys votes associated with the instance of work" do
      work = Work.first
      original_count = work.votes.count
      work.deactivate
      new_count = work.votes.count
      new_count.wont_equal original_count
      new_count.must_equal 0
    end
  end
end
