require "test_helper"

describe User do

  describe 'validations' do
    before do
      @user = User.new(username: 'test username' )
    end

    it 'is valid when all fields are present' do
      result = @user.valid?
      result.must_equal true
    end

    it 'is invalid without a username' do
      @user.username = nil
      result = @user.valid?
      result.must_equal false
      @user.errors.messages.must_include :username
    end

    it 'is invalid with a duplicate username' do
      dup_user = User.first
      @user.username = dup_user.username
      result = @user.valid?
      result.must_equal false
      @user.errors.messages.must_include :username
    end

  end

end
