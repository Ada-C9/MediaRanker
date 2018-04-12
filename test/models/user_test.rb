require "test_helper"

describe User do
  describe "validations" do
    before do
      @user= User.new(username: "me")
    end

    it "can be created with all required fields" do
      result = @user.valid?

      result.must_equal true
    end

    it "is invalid without a username" do
      @user.username = nil

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :username
    end

    it "is invalid with a duplicate username" do
      copy_user = User.first
      @user.username = copy_user.username

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :username
    end
  end
end
