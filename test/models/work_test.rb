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
end
