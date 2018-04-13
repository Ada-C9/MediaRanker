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

    it "requires a unique name" do
      name = "brenda"
      user = User.create!(name: name)
      user2 = User.new(name: name)
      user2.wont_be :valid?
    end
  end

  describe "relations" do
    it "can have votes" do
      u = users(:yellowlion)
      u.votes.count.must_equal 3
    end

    it "shows zero if user has not voted" do
      u = users(:littlepony)
      u.votes.count.must_equal 0
    end
  end
end
