require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must have a user" do
    vote.valid?.must_equal false
    vote.errors.must_include :user_id
  end

  it "must have a work id" do
    vote.valid?.must_equal false
    vote.errors.must_include :work_id

  end
  it 'must respond to user' do
    vote = votes(:vote_one)
    vote.must_respond_to :user
  end
end
