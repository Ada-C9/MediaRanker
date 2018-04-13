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

  describe 'relations' do

    it 'can set the vote through "instagram"' do
      # Create two models
      instagram = Instagram.create!(handle: 'test-handle', followers: 100)
      vote = Vote.new(user_id: 3, instagram: instagram)

      # author_id should have changed accordingly
      vote.instagram_id.must_equal instagram.id
    end
  end
end
