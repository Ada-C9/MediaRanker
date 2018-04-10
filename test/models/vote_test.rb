require "test_helper"

describe Vote do
  # validations

  describe "relationships" do

    it "connects work and work id" do

      poodr = works(:poodr)

      vote_for_poodr = votes(:vote_for_poodr)

      vote_for_poodr.work.must_equal poodr

    end

  end # relationships

end
