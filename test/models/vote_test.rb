require "test_helper"

describe Vote do

  describe "validations" do

    it "is unique for any given work-user combination" do
      poodr = works(:poodr)

      user_one = users(:user_one)

      another_vote_for_poodr = Vote.new

      another_vote_for_poodr.work = poodr

      another_vote_for_poodr.user = user_one

      result = another_vote_for_poodr.valid?

      result.must_equal false

    end

  end # validations

  describe "relationships" do

    it "connects work and work id" do

      poodr = works(:poodr)

      vote_one = votes(:vote_one)

      vote_one.work.must_equal poodr

    end

    it "connects user and user id" do

      user_one = users(:user_one)

      vote_one = votes(:vote_one)

      vote_one.user.must_equal user_one

    end

  end # relationships

end
