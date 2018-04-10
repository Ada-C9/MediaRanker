require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "it accepts a name input" do

  end

  it "does not  accept a nil input" do
    user.user_name =
    user.user_name.wont_be nil
  end

  it "must not be an empty string" do

  end
end
