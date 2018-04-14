require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must belong to a user" do
    vote.valid?.must_equal false
    vote.errors.must_include :user_id
  end

  it "must belong to a work id" do
    vote.valid?.must_equal false
    vote.errors.must_include :work_id

  end

  it 'must respond to user' do
    vote = votes(:vote_one)
    vote.must_respond_to :user
  end

  it 'must respond to work' do
    vote = votes(:vote_one)
    vote.must_respond_to :work
  end

  it 'must have one user' do
    todd = users(:todd)
    votes(:vote_five).user.id.must_equal todd.id
  end

  it 'must have one work' do
    harry_potter = works(:harry_potter)
    votes(:vote_one).work.id.must_equal harry_potter.id
  end
end
