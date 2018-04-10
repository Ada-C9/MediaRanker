require "test_helper"

describe Voteinfo do
  let(:voteinfo) { Voteinfo.new }

  it "must be valid" do
    value(voteinfo).must_be :valid?
  end
end
