require "test_helper"

describe Upvote do
  let(:upvote) { Upvote.new }

  describe 'validations' do
    it "must be valid" do
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

end
