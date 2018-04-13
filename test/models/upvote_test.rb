require "test_helper"

describe Upvote do
  let(:upvote) { Upvote.new }
  let(:vote) { upvotes(:one_up) }


  it "has validation for empty parameters" do
    upvote.valid?.must_equal false
  end

  it "has validation for both ids" do
    vote.valid?.must_equal true
  end

  it "checks for validation with missing id" do
    vote.work_id = nil
    vote.valid?.must_equal false
    vote.errors.messages.must_include :work

    vote.user_id = nil
    vote.valid?.must_equal false
    vote.errors.messages.must_include :user
  end

  it "has validation to ensure a user can upvote only once on a work " do
    vote1 = Upvote.new{upvotes(:one_up)}
    vote1.valid?.must_equal false
    vote1.errors.messages.must_include :work
    vote1.errors.messages.must_include :user
  end

  it "belongs to a work and user" do
    vote.user.must_equal users(:one)
    vote.work.must_equal works(:hp)
  end
end
