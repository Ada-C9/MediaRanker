require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    mary = users(:mary)
    value(mary).must_be :valid?
  end

  it "must have a collection of votes" do
    user.votes.must_equal []
    vote = Vote.new
    user.votes << vote
    user.votes.must_equal [vote]

  end

  it "must have a username" do
    user.must_respond_to :username
    users(:pickles).username.must_equal "pickles"
  end

end
