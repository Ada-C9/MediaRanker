require "test_helper"

describe Work do
  let(:work) { Work.new category: "film", title: "hello", creator: "Jane" }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must have a category" do

  end

  it "must have a title" do
  end

end
