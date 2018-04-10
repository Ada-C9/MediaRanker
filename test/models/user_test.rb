require "test_helper"

describe User do
  describe "validations" do
    it "is valid with a name" do
      u = users(:yellowlion)
      result = u.valid?
      result.must_equal true
    end

    it "is invalid without a name" do
      u = User.new
      result = u.valid?
      result.must_equal false
      u.errors.messages.must_include :name
    end
  end

  describe "relations" do
    it "must have votes" do
      u = users(:yellowlion)
      u.votes.count.must_equal 2
    end

    it "must have votes" do
      u = users(:littlepony)
      u.votes.count.must_equal 0
    end
  end
end
