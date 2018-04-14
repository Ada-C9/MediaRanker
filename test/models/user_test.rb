require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    nora = users(:nora)
    value(nora).must_be :valid?
  end

  it "must have a collection of votes" do
    user.votes.must_equal []
    vote = Vote.new
    user.votes << vote
    user.votes.must_equal [vote]

    users(:nora).votes.length.must_equal 2
  end

  it "must have a username" do
    user.must_respond_to :username
    users(:chad).username.must_equal "Chad"

    user.valid?.must_equal false
    user.errors.must_include :username
  end

end
