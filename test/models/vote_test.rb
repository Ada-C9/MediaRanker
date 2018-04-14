require "test_helper"

describe Vote do
  describe "validations" do
    before do
      user = User.first
      work = Work.first
      @vote = Vote.new(user_id: user.id, work_id: work.id)
    end

    it "can be created" do
      result = @vote.valid?

      result.must_equal true
    end
  end

  describe "relations" do
    before do
      @vote = Vote.new
    end

    it "connects user and user_id" do
      user = User.first

      @vote.user = user

      @vote.user_id.must_equal user.id
    end

    it "connects work and work_id" do
      work = Work.first

      @vote.work = work

      @vote.work_id.must_equal work.id
    end
  end
end
