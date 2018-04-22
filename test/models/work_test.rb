require "test_helper"

describe Work do

  it "must be valid" do
    work = works(:redfern)
    value(work).must_be :valid?
  end
end
