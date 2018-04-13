require "test_helper"

describe Vote do
  let(:vote1) { votes(:vote1) }
  let(:vote2) { votes(:vote2) }

  describe "validations" do
    it "is valid with a user and work" do
      vote1.valid?.must_equal true
    end

    it "is not valid without a user" do
      vote1.user = nil
      vote1.valid?.must_equal false
    end

    it "is not valid without a work" do
      vote1.work = nil
      vote1.valid?.must_equal false
    end

    it "is not valid if a user votes on one work twice" do
      vote2.work = vote1.work
      vote2.valid?.must_equal false
    end
  end

  describe "relations" do
    it can set
  end
end
