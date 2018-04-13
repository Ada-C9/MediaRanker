require "test_helper"

describe Vote do
  describe "validations" do
    before do
      @existing_vote = Vote.create!(user_id: User.last.id, work_id: Work.last.id)
      @vote = Vote.new(user_id: User.first.id, work_id: Work.first.id)
    end

    it "can be created with all required fields" do
      result = @vote.valid?

      result.must_equal true
    end

    it "is invalid without a user_id" do
      @vote.user_id = nil

      result = @vote.valid?

      result.must_equal false
      @vote.errors.messages.must_include :user_id
    end

    it "is invalid without a work_id" do
      @vote.work_id = nil

      result = @vote.valid?

      result.must_equal false
      @vote.errors.messages.must_include :work_id
    end

    it "can be created with a duplicate work_id and different user_id" do
      @vote.work_id = @existing_vote.work_id

      result = @vote.valid?

      result.must_equal true
    end

    it "can be created with a duplicate user_id and different work_id" do
      @vote.user_id = @existing_vote.user_id

      result = @vote.valid?

      result.must_equal true
    end

    it "is invalid with a duplicate user_id and work_id" do
      @vote.work_id = @existing_vote.work_id
      @vote.user_id = @existing_vote.user_id

      result = @vote.valid?

      result.must_equal false
    end
  end
end
