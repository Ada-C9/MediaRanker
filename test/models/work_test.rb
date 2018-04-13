require "test_helper"

describe Work do
  describe "validations" do
    before do
      @work = Work.new(category: "album", title: "test album", creator: "Anne", publication_year: 2018, description: "best album")
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
  end

  describe "relations" do
    before do
      @work = Work.new(title: "Test Work")
    end

    
  end
end
