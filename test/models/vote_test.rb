require "test_helper"

describe Vote do
  describe "relations" do
    before do
      @vote = votes(:one)
    end
    it "is valid when a vote connects a user" do
      user = User.first
      user.votes << @vote

      @vote.user_id.must_equal user.id
    end

    it "is valid when a vote connects a work" do
      work = Work.first
      work.votes << @vote

      @vote.work_id.must_equal work.id
    end
  end
end
