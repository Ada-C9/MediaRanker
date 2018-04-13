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

  describe "validation" do
    before do
      @vote = votes(:two)
    end

    it "is valid when the vote is unique" do
      vote1 = Vote.new(user_id: users(:coco).id, work_id: works(:three).id)
      result = vote1.valid?
      result.must_equal true
    end

    it "is invalid when a user wants to vote twice for the same work" do
      vote2 = votes(:five)
      result = vote2.valid?
      result.must_equal false
    end

  end
end
