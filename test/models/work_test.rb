require "test_helper"

describe Work do
  let(:work) { Work.new title: "Les Pas Perdus", category: "book" }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must have a category" do
    work.category = nil
    value(work).must_be :invalid?
  end

  it "must have a title" do
    work.title = ""
    value(work).must_be :invalid?
    work.title = "Mission Child"
    value(work).must_be :valid?
  end

  it "must have a unique title" do
    work.title = "Rebirth"
    value(work).must_be :invalid?
  end

  it "must have a title between 1 and 25 letters" do
    work.category = "album"

    work.title = ""
    work.valid?.must_equal false

    work.title = "1234567890123456789012345678901234567890"
    work.valid?.must_equal false
  end

  describe "works_with_vote_tallies" do
  

  end

  describe "get_top_ten_works_with_tallies" do

  end

  describe "get_top_work_with_tally" do

  end
end
