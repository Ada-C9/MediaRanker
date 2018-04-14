require "test_helper"

describe User do
  let(:user1) { users(:user1) }
  describe "validations" do
    it "is valid when required fields are present" do
      user1.valid?.must_equal true
    end

    it "is not valid when required fields are not present" do
      user1.name = nil
      user1.valid?.must_equal false
    end
  end

  describe "relations" do
    it "must respond to votes" do
      user1.must_respond_to :votes
    end

    it "must respond to works" do
      user1.must_respond_to :works
    end
  end
end
