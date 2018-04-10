require "test_helper"

describe User do

  describe "validations" do

    it "must have a username" do
      new_user = User.new

      result = new_user.valid?

      result.must_equal false
    end

  end # validations

  describe "relationships" do

    it "connects vote and vote id" do

      vote_for_poodr = votes(:vote_for_poodr)

      test_user = users(:test_user)

      test_user.votes.must_include vote_for_poodr

    end

  end # relationships

end
