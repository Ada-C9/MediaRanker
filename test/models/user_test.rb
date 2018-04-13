require "test_helper"

describe User do

  it "exists" do
    result = User.first
    result.must_equal true
  end
end
