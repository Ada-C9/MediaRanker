require "test_helper"

describe Vote do

  describe "validations" do

    it "is unique for any given work-user combination" do
      poodr = works(:poodr)

      test_user = users(:test_user)

      another_vote_for_poodr = Vote.new

      another_vote_for_poodr.work = poodr

      another_vote_for_poodr.user = test_user

      result = another_vote_for_poodr.valid?

      result.must_equal false

    end

  end # validations

  describe "relationships" do

    it "connects work and work id" do

      poodr = works(:poodr)

      vote_for_poodr = votes(:vote_for_poodr)

      vote_for_poodr.work.must_equal poodr

    end

    it "connects user and user id" do

      test_user = users(:test_user)

      vote_for_poodr = votes(:vote_for_poodr)

      vote_for_poodr.user.must_equal test_user

    end

  end # relationships

end
