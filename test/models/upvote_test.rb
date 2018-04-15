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
    puts "_________start duplication test____________"
    upvote_a = upvotes(:up_nineteen)
    upvote_b = upvotes(:up_twenty)
    upvote_b.valid?.must_equal false
    puts upvote_a.valid?
    puts upvote_a.user_id
    puts upvote_a.created_at.strftime("%B %d, %Y")
    puts upvote_a.errors

    puts
    puts upvote_b.valid?
    puts upvote_b.user_id
    puts upvote_b.created_at

    puts
    puts upvote_a.created_at - upvote_b.created_at
    puts
    puts today_date = Time.now
    puts  upvote_b.created_at
    puts today_date - upvote_b.created_at

    puts "_________end duplication test____________"
  end

end
