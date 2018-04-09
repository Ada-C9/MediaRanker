require "test_helper"

describe Publication do
  let(:publication) { Publication.new }

  it "must be valid" do
    value(publication).must_be :valid?
  end
end
