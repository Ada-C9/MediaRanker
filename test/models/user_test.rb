require "test_helper"

describe User do
  describe "validations" do
    before do
      @user = User.new(name: "Anne")
    end

    it "can be created with all required fields" do
      result = @user.valid?
      result.must_equal true
    end

    it "is invalid without a name" do
      @user.name = nil

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :name
    end
  end

  describe "relations" do
    before do
      @user = User.create(name: "Anne")
      @work = Work.first
    end

    it "can create a vote" do
      vote = Vote.create(user_id: @user.id, work_id: @work.id)

      result = vote.valid?
      result.must_equal true
    end

    it "can have a count of votes" do
      vote = Vote.create(user_id: @user.id, work_id: @work.id)
      vote_b = Vote.create(user_id: @user.id, work_id: @work.id)
      vote_c = Vote.create(user_id: @user.id, work_id: @work.id)

      result = @user.votes.count
      result.must_equal 3
    end

  end
end
