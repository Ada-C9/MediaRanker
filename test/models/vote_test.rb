require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do
    value(vote).must_be :valid?
  end
end

describe Vote do
  describe 'relations' do
    it "has a work" do
      vote = votes(:vote_1)
      vote.work_id.must_equal works(:beyonce)
    end

    it "has a user" do
      vote = votes(:vote_2)
      vote.user_id.must_equal works(:potterhead)
    end
  end
end
