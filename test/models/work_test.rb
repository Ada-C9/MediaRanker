require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must have a collection of votes" do
    work.votes.must_equal []
    vote = Vote.new
    work.votes << vote
    work.votes.must_equal [vote]
  end

end
