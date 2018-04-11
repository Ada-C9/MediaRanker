require "test_helper"

describe Work do
  let(:work) { Work.new(category: "movie", title: "Selma")}

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must be invalid without a category" do
    work.category = nil
    value(work).wont_be :valid?
  end

  it "must be invalid without a title" do
    work.title = nil
    value(work).wont_be :valid?
  end


end
