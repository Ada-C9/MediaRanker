require "test_helper"

describe Work do
  describe "validations" do
    before do
      @work = Work.new(category: "album", title: "test album", creator: "Anne", publication_year: 2018, description: "best album")
    end

    it "can be created" do
      result = @work.valid?
      result.must_equal true
    end
  end

  describe "relations" do

  end
end
