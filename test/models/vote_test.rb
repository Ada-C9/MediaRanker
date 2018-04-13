require "test_helper"

describe Vote do
  describe 'validations' do
    before do
      @vote = Vote.new(user_id: 1, twitter_id: nil,instagram_id: nil,subreddit_id: nil )
    end

    it 'must be valid' do
      result = @vote.valid?

      result.must_equal false
    end

    it 'is not valid without a user' do
    @vote.user_id = ''

    result = @vote.valid?

    result.must_equal false
  @vote.errors.messages.must_include :user
  end
  end
end
