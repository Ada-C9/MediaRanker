require "test_helper"

describe Work do
  let(:work) { Work.new title: "Wizard of Oz", category: "movie"}

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must have a title" do
    work.title = nil

    work.valid?.must_equal false
    work.errors.must_include :title
  end

  it "must have a creator" do
    work.category = nil

    work.valid?.must_equal false
    work.errors.must_include :category
  end

end
