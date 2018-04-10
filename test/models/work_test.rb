require "test_helper"

describe Work do

  it "is valid when all fields are present" do
    works(:aja).valid?.must_equal true
  end

  it "is invalid without a title" do
    works(:aja).title = nil

    works(:aja).valid?.must_equal false
    works(:aja).errors.messages.must_include :title
  end

end
