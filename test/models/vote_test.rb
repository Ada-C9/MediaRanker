require "test_helper"

describe Vote do

  it "must have a user" do
    vote = Vote.new(publication_id: 1)
    vote.valid?.must_equal false
    vote.errors.must_include :user_id
  end

  it "has a publication" do
    vote = Vote.new(user_id: 1)
    vote.valid?.must_equal false
    vote.errors.must_include :publication_id
  end
end
