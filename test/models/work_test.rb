require "test_helper"

describe Work do

  it "is valid when all fields are present" do
    works(:aja).valid?.must_equal true
  end

  it "is invalid without a title" do
    work = Work.new

    work.valid?.must_equal false
    work.errors.messages.must_include :title
  end

end
