require "test_helper"

describe Vote do
  describe "Validations" do
    before do
      @vote = Vote.first
    end

    it "can be created with all required fields" do
      # Act
      result = @vote.valid?

      # Assert
      result.must_equal true
    end

    it "must be invalid without a user" do
      @vote.user = nil

      value(@vote).wont_be :valid?
    end

    it "must be invalid without a work" do
      @vote.work = nil

      value(@vote).wont_be :valid?
    end

    it "is invalid with a duplicate work" do
      dup_vote = Vote.new(work: @vote.work)

      result = dup_vote.valid?

      result.must_equal false
      dup_vote.errors.messages.must_include :user
    end

    it "is invalid with a duplicate user" do
      dup_vote = Vote.new(user: @vote.user)

      result = dup_vote.valid?

      result.must_equal false
      dup_vote.errors.messages.must_include :work
    end
  end

  describe "relations" do
    before do
      @user = users(:tango)
      @work = works(:HP)
      @vote = Vote.new(user_id: @user.id, work_id: @work.id)
    end

    # user
    it "connects votes and user_ids" do
      # Assert
      @vote.must_respond_to :user_id
    end

    # work
    it "connects votes and work_ids" do
      # Assert
      @vote.must_respond_to :work_id
    end
  end
end
