require "test_helper"

describe Twitter do
  describe 'validations' do

    before do
      #arrange
      @twitter= Twitter.new(handle: 'handle', followers: 8888)
    end

    it 'must just be valid' do
        result = @twitter.valid?

        result.must_equal true
    end

    it 'is not valid without a handle' do
      @twitter.handle = ''

      result = @twitter.valid?

      result.must_equal false
    end

    it 'is not valid without follower' do
      @twitter.followers = ''

      result = @twitter.valid?

      result.must_equal false


    end
  end

  describe 'relations' do

    it 'can set the vote through "twitter"' do
      # Create two models
      twitter = Twitter.create!(handle: 'test-handle', followers: 100)
      vote = Vote.new(user_id: 3, twitter: twitter)

      # author_id should have changed accordingly
      vote.twitter_id.must_equal twitter.id
    end
  end

end
