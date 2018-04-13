require "test_helper"


describe Vote do
  before do
    @vote = votes(:vote1)
  end

  it "must be valid" do
    value(@vote).must_be :valid?
  end

end
