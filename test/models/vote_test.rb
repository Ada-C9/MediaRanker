require "test_helper"

describe Vote do

  it "must be valid" do
    value(vote).must_be :valid?
  end
end
