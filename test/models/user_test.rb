require "test_helper"
require 'pry'

describe User do
  let(:user) { users(:angela) }

  it "must be valid" do
  user.valid?.must_equal true
  end

  it "must not be nil" do
    user.user_name = nil
    user.valid?.must_equal false
  end

  it "must not be an empty string" do
    local_ada = users(:ada)
    local_ada.user_name = " "
    local_ada.valid?.must_equal false
  end

  it "must have a unique name" do
    local_ada = users(:ada)
    local_toshi = users(:evan)
    local_toshi.user_name = "Ada"
    local_toshi.valid?.must_equal false
  end

end
