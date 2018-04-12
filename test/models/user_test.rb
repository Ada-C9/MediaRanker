require "test_helper"

describe User do
  let(:user) { User.new }

  it "must have username" do
    user.valid?.must_equal false
  end

  it "can create a new user" do
    user = User.new(name: "James")
    user.save.must_equal true
  end

  it "username must be unique" do
    user = users(:joe)
    user.valid?.must_equal true

    user2 = User.new(name: "Joe")
    user2.save.must_equal false
  end
end
