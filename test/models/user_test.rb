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

  describe 'relations' do

    it "will return 0 if they have no votes" do
      users(:maddie).votes.count.must_equal 0
    end

    it "will return correct number of votes" do
      users(:evan).votes.count.must_equal 1
    end

  end

end
