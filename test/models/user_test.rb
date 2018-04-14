require "test_helper"

describe User do
  let(:user) { users(:user_one) }

  describe 'validations' do
    it "must accept a user with valid inputs" do
      user.valid?.must_equal true
    end

    it "does not accept a nil input" do
      user.user_name = nil
      user.valid?.must_equal false
    end

    it "must not be an empty string" do
      user.user_name = ""
      user.valid?.must_equal false
    end

    it "must require unique user_name" do
      user
      new_user = User.create user_name: "MaggieMutt"
      new_user.valid?.must_equal false
    end
  end

  describe 'relations' do
    it "must have a relationship between user and votes" do
      user.votes.count.must_equal 7
    end

    it "must respond to votes" do
      user.must_respond_to :votes
    end
  end
end
