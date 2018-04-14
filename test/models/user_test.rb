require "test_helper"

describe User do
  let(:user) { users(:user_one)}

  it "must accept a user with valid inputs" do
    user.valid?.must_equal true
  end

  it "it accepts a name input" do

  end

  it "does not accept a nil input" do
    user.user_name = nil
    user.user_name.wont_be nil
  end

  it "must not be an empty string" do

  end
end
