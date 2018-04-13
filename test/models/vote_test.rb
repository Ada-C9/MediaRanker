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

  it 'must respond to work' do
    vote = votes(:vote_one)
    vote.must_respond_to :work
  end

  it 'must have one user' do
    pixie = users(:pixie)
    votes(:vote_one).user.id.must_equal pixie.id
  end

  it 'must have one work' do
    harry_potter = works(:harry_potter)
    votes(:vote_one).work.id.must_equal harry_potter.id
  end
end
