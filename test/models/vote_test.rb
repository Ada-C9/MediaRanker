require "test_helper"

describe Vote do
  let(:some_vote) { votes(:vote1) }

  describe 'Vote validity' do
    it 'must be valid' do
      some_vote.valid?.must_equal true
    end
    it 'must be valid if user or publication already have a vote' do
      same_user_vote = Vote.new(user: users(:usako), publication: publications(:spirited))
      same_publication_vote = Vote.new(user: users(:sailors), publication: publications(:cardcaptor))

      same_user_vote.valid?.must_equal true
      same_publication_vote.valid?.must_equal true
    end
    it 'must not be valid without a user or a publication' do
      some_vote.user = nil

      some_vote.valid?.must_equal false

      some_vote.user = users(:usako)
      some_vote.publication = nil
      
      some_vote.valid?.must_equal false
    end
    it 'must not be valid if a vote already exists with both the same user and same publication' do
      duplicate_vote = Vote.new(user: users(:usako), publication: publications(:cardcaptor))

      duplicate_vote.valid?.must_equal false
    end
  end

  describe 'vote relationships' do
    it 'it has a user and a publication' do
       some_vote.user.must_equal users(:usako)
       some_vote.publication.must_equal publications(:cardcaptor)
    end
  end
end
