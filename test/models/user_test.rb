require "test_helper"

describe User do
  let(:user) { users(:jones)}

  it "must be valid when there is a name present" do
   user.valid?.must_equal true
 end

 it "must not be valid if there is no name" do
   user.name = nil
   user.valid?.must_equal false
   user.errors.must_include :name
 end

end
