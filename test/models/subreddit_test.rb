require "test_helper"

describe Subreddit do
  describe 'validations' do

    before do
      #arrange
      @subreddit = Subreddit.new(title: 'test-title', description: 'test-description', subscribers: 'subscribers')
    end

    it "must be valid" do
      result = @subreddit.valid?

      result.must_equal true
    end

    it 'is invalid without a title' do
      #arrange
      @subreddit.title = nil

      #act
      result = @subreddit.valid?

      #assert
      result.must_equal false
      @subreddit.errors.messages.must_include :title
    end
  end
  describe 'relations' do

    it 'can set the vote through "subreddit"' do
      # Create two models
      subreddit = Subreddit.create!(title: 'test-title')
      vote = Vote.new(user_id: 3, subreddit: subreddit)

      # Make the models relate to one another
      vote.subreddit = subreddit

      # author_id should have changed accordingly
      vote.subreddit_id.must_equal subreddit.id
    end
  end
end
