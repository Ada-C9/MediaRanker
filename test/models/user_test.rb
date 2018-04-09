require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "must have a collection of votes" do
    user.votes.must_equal []
    vote = Vote.new
    user.votes << vote
    user.votes.must_equal [vote]
  end

end
