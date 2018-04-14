require "test_helper"

describe Vote do
  let(:vote) { votes(:vote_one) }
  describe "validations" do
    it "must be valid with valid inputs" do
      vote.valid?.must_equal true
    end

    it "does not accept a nil user input" do
      vote.user = nil
      vote.valid?.must_equal false
    end

    it "does not accept a nil work input" do
      vote.work = nil
      vote.valid?.must_equal false
    end

    it "does not allow a user to vote for the same work more than once" do
      vote
      new_vote = Vote.create(user: users(:user_one), work: works(:work_one))
      new_vote.valid?.must_equal false
    end
  end

  describe "relationships" do
    it "responds to user" do
      vote.must_respond_to :user
    end

    it "responds to work" do
      vote.must_respond_to :work
    end
  end
end
