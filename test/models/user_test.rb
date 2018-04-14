require "test_helper"

describe User do
  describe "validations" do
    # all validations pass
    before do
      @user = users(:angela)
    end

    it "can be created will all required fields" do
      # Act
      result = @user.valid?

      # Assert
      result.must_equal true
    end

    it "is invalid without a name" do
      @user.name = nil

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :name
    end

    # duplicate title -> fail
    it "is invalid with a duplicate name" do

      user = User.create(name: "angela")

      result = user.valid?

      result.must_equal false
      user.errors.messages.must_include :name
    end
  end

  describe 'relations' do
    before do
      @work = works(:lemonade)
      @user = users(:angela)
    end

    it "connects vote and vote_id" do
      # Arrange
      vote = Vote.create!(user_id: @user.id, work_id: @work.id)
      vote.user.must_equal @user
      # Assert
    end
  end

  describe 'business logic' do
    before do
    end

  end


end
