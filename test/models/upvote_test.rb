require "test_helper"

describe Upvote do
  let(:upvote) { Upvote.new }

  describe 'validations' do
    it "must have valid information" do
      upvote = Upvote.new
      result = upvote.valid?
      result.must_equal false
    end

    it "must be valid" do
      upvote = upvotes(:up_one)
      result = upvote.valid?
      result.must_equal true
    end
  end

  it 'must have a work' do
    upvote = upvotes(:up_seventeen)
    upvote.valid?.must_equal false
    upvote.errors.must_include :work
  end

  it 'must have a user' do
    upvote = upvotes(:up_eighteen)
    upvote.valid?.must_equal false
    upvote.errors.must_include :user
  end

  it "must not let a user vote for the same work twice in a day" do
    upvote_a = upvotes(:up_nineteen)
    upvote_b = upvotes(:up_twenty)
    upvote_b.valid?.must_equal false
  end

end
