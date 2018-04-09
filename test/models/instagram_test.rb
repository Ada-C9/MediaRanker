require "test_helper"

describe Instagram do
  let(:instagram) { Instagram.new }

  it "must be valid" do
    value(instagram).must_be :valid?
  end
end
