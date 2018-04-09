require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must have a user" do
    vote.valid?.must_equal false
    vote.errors.must_include :user_id
  end

  it "must have a work" do
    vote.valid?.must_equal false
    vote.errors.must_include :work_id
  end

end
