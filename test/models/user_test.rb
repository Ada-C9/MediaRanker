require "test_helper"
require 'date'
require 'pry'
describe User do
  describe 'validations' do
    before do
      # Arrange
      @user = User.new(user_name: users(:c_dagger).user_name, join_date: users(:c_dagger).join_date)
    end

    it 'is valid when it has a user_name and join_date' do
      # Act
      result = @user.valid?

      # Assert
      result.must_equal true
    end

    it 'is invalid when it has no user_name' do
      # Arrange
      @user.user_name = nil
      # Act
      result = @user.valid?
      # Assert
      result.must_equal false
    end

    it 'is invalid when it has no join_date' do
      @user.join_date = nil
      result = @user.valid?
      result.must_equal false
    end
  end
end
# TODO: BUILD TESTS FOR USER MODEL BASED ON RELATIONSHIPS
