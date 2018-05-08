require "test_helper"

describe Vote do
  describe 'validations' do
    before do
      @current_vote = votes(:vote_one)
      @vote = Vote.new(user: users(:ada), work: works(:kindred))
    end

    it "it can create a valid vote with all required parameters" do
      result = @vote.valid?
      result.must_equal true
    end
  end

  describe "relations" do
    it "has a user" do
      v = votes(:vote_one)
      v.must_respond_to :user
      v.user.must_be_kind_of User
    end

    it "has a work" do
      v = votes(:vote_one)
      v.must_respond_to :work
      v.work.must_be_kind_of Work
    end
  end

  describe "validations" do
    before do
      @user1 = users(:ada)
      @user2 = users(:grace)
      @work1 = works(:exhile)
      @work2 = works(:selma)
    end

    it "allows one user to vote for multiple works" do
      vote1 = Vote.new(user: @user1, work: @work1)
      vote1.save!
      vote2 = Vote.new(user: @user1, work: @work2)
      vote2.valid?.must_equal true
    end

    it "allows multiple users to vote for a work" do
      vote1 = Vote.new(user: @user1, work: @work1)
      vote1.save!
      vote2 = Vote.new(user: @user2, work: @work1)
      vote2.valid?.must_equal true
    end

    it "doesn't allow the same user to vote for the same work twice" do
      vote1 = Vote.new(user: @user1, work: @work1)
      vote1.save!
      vote2 = Vote.new(user: @user1, work: @work1)
      vote2.valid?.must_equal false
      vote2.errors.messages.must_include :user
    end
  end
end
