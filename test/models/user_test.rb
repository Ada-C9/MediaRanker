require "test_helper"

describe User do

  it "has a name" do
    user = users(:bob)
    user.name.must_equal "bobbins123"
  end

  it "requires a name" do
    user = users(:bob)
    user.name = ""
    user.valid?.must_equal false
    user.errors.must_include :name
  end

  it "does not allow spaces" do
    user = users(:bob)
    user.name = "wow wee"
    user.valid?.must_equal false
    user.errors.must_include :name
  end

  it "does not allow names longer than 25 characters" do
    user = users(:bob)
    user.name = "whateversomethinganotherthingokaygosuper"
    user.valid?.must_equal false
    user.errors.must_include :name
  end
end
