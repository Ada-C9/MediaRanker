require "test_helper"

describe User do
  let(:user) { User.new name: "person"}

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "must have a name" do
    user.name = nil
    user.save
    
    user.valid?.must_equal false
  end


end
