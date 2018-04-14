require "test_helper"

describe User do
  describe 'validations' do
    before do
      @user = User.new(name:User.first)
    end

    it "can be created with required fields" do
      result = @user.valid?

      result.must_equal true
    end

    it "is invalid without a user name" do
      @user.name = nil

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :name
    end

    it "is invalid with a duplicate name" do
      duplicate = User.first

      @user.name = duplicate.name
      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :name
    end
  end
end
