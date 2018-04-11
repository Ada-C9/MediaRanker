require "test_helper"

describe User do
  let(:user) { User.new name:"Bee"}

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "must have a name" do
    user.name = nil

    user.valid?.must_equal false
    user.errors.must_include :name
  end

  it "name must be uniq" do
    # Why not working?
    user.name = "Bee"
    second_user = user.dup

    second_user.valid?.must_equal false
    second_user.errors.must_include :name
  end

end
