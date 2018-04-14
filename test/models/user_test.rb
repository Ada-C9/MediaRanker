require "test_helper"
require "pry"

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

  describe 'relations' do

    it 'has many votes' do
    end

    it 'has many works through votes' do
    end

  end

end
