require "test_helper"

describe Vote do

  it "must have a user" do
    vote = votes(:one)
    vote.user_id = nil
    vote.valid?.must_equal false
    vote.errors.must_include :user_id
  end

  it "has a publication" do
    vote = votes(:one)
    vote.publication_id = nil
    vote.valid?.must_equal false
    vote.errors.must_include :publication_id
  end

  it "cannot be a duplicate" do
    vote = votes(:one)
    vote2 = votes(:two)
    vote2.user_id = vote.user_id
    vote2.publication_id = vote.publication_id
    vote2.valid?.must_equal false
  end

end
