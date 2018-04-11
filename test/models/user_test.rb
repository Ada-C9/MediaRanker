require "test_helper"

describe User do

  it "has an a name" do
    user = users(:bob)
    user.name.must_equal "bobbins123"
  end

  it "requires a name" do
    user = User.new(name:"")
    user.valid?.must_equal false
    user.errors.must_include :name
  end

  it "does not allow spaces" do
    user = User.new(name:"wow wee")
    user.valid?.must_equal false
    user.errors.must_include :name
  end

  it "does not allow names longer than 25 characters" do
    user = User.new(name:"whateversomethinganotherthingokaygosuper")
    user.valid?.must_equal false
    user.errors.must_include :name
  end
end
