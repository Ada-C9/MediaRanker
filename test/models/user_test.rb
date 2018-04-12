require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    skip
    value(user).must_be :valid?
  end

  it "must not be nil" do
    skip
    user.user_name = "Angela"
    user.user_name.wont_be nil
  end

  it "must not be an empty string" do
    skip
    user.user_name.wont_be " "

  end

end
