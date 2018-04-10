require "test_helper"

describe Work do


  it "must be valid" do
    hp = works(:harry_potter)
    value(hp).must_be :valid?
  end

  it "must have a collection of votes" do
    works(:revolver).votes.must_equal []
    vote = Vote.new
    works(:revolver).votes << vote
    works(:revolver).votes.must_equal [vote]
  end



end
