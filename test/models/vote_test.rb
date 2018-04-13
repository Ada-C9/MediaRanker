require "test_helper"

describe Vote do
  describe "validations" do
    before do
      @existing_vote = Vote.create!(user: User.last, work: Work.last)
      @vote = Vote.new(user: User.first, work: Work.first)
    end

    it "can be created with all required fields" do
      result = @vote.valid?

      result.must_equal true
    end

    it "is invalid without a user" do
      @vote.user = nil

      result = @vote.valid?

      result.must_equal false
      @vote.errors.messages.must_include :user
    end

    it "is invalid without a work" do
      @vote.work = nil

      result = @vote.valid?

      result.must_equal false
      @vote.errors.messages.must_include :work
    end

    it "can be created with a duplicate work and different user" do
      @vote.work = @existing_vote.work

      result = @vote.valid?

      result.must_equal true
    end

    it "can be created with a duplicate user and different work" do
      @vote.user = @existing_vote.user

      result = @vote.valid?

      result.must_equal true
    end

    it "is invalid with a duplicate user and work" do
      @vote.work = @existing_vote.work
      @vote.user = @existing_vote.user

      result = @vote.valid?

      result.must_equal false
    end
  end

  describe "relations" do
    it "connects user and user_id" do
      user = User.first

      vote = Vote.create!(user: user, work: Work.first)

      vote.user_id.must_equal user.id
    end

    it "connects work and work_id" do
      work = Work.first

      vote = Vote.create!(user: User.first, work: work)

      vote.work_id.must_equal work.id
    end
  end
end
