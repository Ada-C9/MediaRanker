require "test_helper"

describe Instagram do
  describe 'validations' do

    before do
      #arrange
      @instagram = Instagram.new(handle: 'test-handle', followers: 2222)
    end

    it "is valid when all fields are present" do
      #act
      result = @instagram.valid?

      result.must_equal true
    end

    it 'is invalid without a handle' do
      #arrange
      @instagram.handle = nil

      #act
      result = @instagram.valid?

      #assert
      result.must_equal false
      @instagram.errors.messages.must_include :handle
    end
  end
end
