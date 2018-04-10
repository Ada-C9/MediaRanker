require "test_helper"

describe Vote do
  before do
    @vote = Vote.new(user_id: 1, work_id: 1,   vote_date: 2017-04-19)
  end
  it "is valid when all fields are present" do
    result = @vote.valid?
    result.must_equal true
  end

  it 'is invalid without a user_id' do
    @vote.user_id = nil
    result = @vote.valid?
    result.must_equal false
    @vote.errors.messages.must_include :user_id
  end

  it 'is invalid without a work_id' do
    @vote.work_id = nil
    result = @vote.valid?
    result.must_equal false
    @vote.errors.messages.must_include :work_id
  end

  it 'is invalid without a vote_date' do
    @vote.vote_date = nil
    result = @vote.valid?
    result.must_equal false
    @vote.errors.messages.must_include :vote_date
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
