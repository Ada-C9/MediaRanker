require "test_helper"

describe User do

  describe "Validations" do
    before do
      @user = User.first
    end


    it "can be created with all required fields" do
      # Act
      result = @user.valid?

      # Assert
      result.must_equal true
    end

    it "must be invalid without a category" do
      @user.name = nil

      value(@user).wont_be :valid?
    end


    it "is invalid with a duplicate name" do
      dup_name = User.new(name: @user.name)

      result = dup_name.valid?

      result.must_equal false
      dup_name.errors.messages.must_include :name
    end
  end

  #
  # describe "relations" do
  #   before do
  #     @work = Work.new(title: 'test work')
  #   end
  #
  #   # votes
  #   it "connects votes and vote_ids" do
  #     # Arrange
  #     vote = Vote.first
  #
  #     # Act
  #     @work.votes << vote
  #
  #     # Assert
  #     @work.vote_ids.must_include vote.id
  #   end
  #
  # end

end
