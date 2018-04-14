require "test_helper"

describe User do
  describe "validations" do
    let(:user) { User.new(name: "dikla") }
    it "must be valid" do
      value(user).must_be :valid?
    end

    it "must be invalid without a name" do
      user.name = nil
      value(user).wont_be :valid?
    end
  end

  describe "relations" do
    it "must have votes" do
      user = users(:dikla)
      user.votes.count.must_equal 1
    end

    it "must have no votes" do
      user = users(:ari)
      user.votes.count.must_equal 0
    end
  end
end
