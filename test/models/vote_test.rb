require "test_helper"

describe Vote do
  # validations

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
