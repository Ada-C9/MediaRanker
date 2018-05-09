require "test_helper"

describe Vote do
  describe 'vote creation' do
    before do
      @current_vote = votes(:vote_one)
      user = User.create!(name: 'Magdalena')
      @vote = Vote.create!(user: user, work: works(:kindred))
    end

    it "it can create a valid vote with all required parameters" do
      result = @vote.valid?
      @vote.must_be :valid?
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
      @user2 = users(:kate)
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
      vote1 = Vote.create!(user: @user1, work: @work1)
      vote2 = Vote.new(user: @user1, work: @work1)
      vote2.valid?.must_equal false
      vote2.errors.messages[:work][0].must_include "has already been taken"
    end
  end
end
