require "test_helper"

describe User do
  let(:usachan) { users(:usako) }

  describe 'user validity' do
    it 'must be valid' do
      usachan.valid?.must_equal true
    end
    it 'must have a name' do
      usachan.name = nil

      usachan.valid?.must_equal false
    end
    it 'cant have an empty string as a name' do
      usachan.name = ""

      usachan.valid?.must_equal false
    end
    it 'has to have a unique name' do
      duplicate_user = User.new(name: "Usagi")

      duplicate_user.valid?.must_equal false
    end
  end

  describe 'user relationships' do
    it 'can have zero or more votes' do
      #zero votes
      users(:sailors).votes.must_be_empty

      #multiple votes
      usachan.votes.must_include votes(:vote1)
      usachan.votes.must_include votes(:vote31)
      usachan.votes.length.must_equal 10
    end
  end
end
