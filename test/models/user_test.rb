require "test_helper"

describe User do
  describe "validations" do
    it "is valid with a name" do
      user = users(:yellowlion)
      result = user.valid?
      result.must_equal true
    end

    it "is invalid without a name" do
      user = User.new
      result = user.valid?
      result.must_equal false
      user.errors.messages.must_include :name
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
      user = users(:yellowlion)
      user.votes.count.must_equal 8
    end

    it "shows zero if user has not voted" do
      user = users(:supermario)
      user.votes.count.must_equal 0
    end
  end
end
