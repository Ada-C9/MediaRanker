require "test_helper"

describe User do
  let(:user) { User.new }
  let(:user_1) { users(:one) }

  it "must be valid" do
    user.valid?.must_equal false
  end

  it "has validation" do
    user_1.valid?.must_equal true
  end

  it "has validation for empty name" do
    user_1.name = nil
    user_1.valid?.must_equal false
    user_1.errors.messages.must_include :name

    user_1.name = ""
    user_1.valid?.must_equal false
    user_1.errors.messages.must_include :name
  end

  it "has validation for uniqueness" do
    user = User.new(name: user_1.name)

    user.valid?.must_equal false
    user.errors.messages.must_include :name

  end
end
