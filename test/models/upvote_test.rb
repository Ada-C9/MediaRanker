require "test_helper"

describe Upvote do
  let(:upvote) { Upvote.new }
  let(:vote) { upvotes(:one) }


  it "has validation for empty parameters" do
    upvote.valid?.must_equal false
  end

  it "has validation for both ids" do
    vote.valid?.must_equal true
  end

  it "checks for validation with missing id" do
  vote.work_id = nil
  vote.valid?.must_equal false
  vote.user_id = nil
  vote.valid?.must_equal false
end


end
