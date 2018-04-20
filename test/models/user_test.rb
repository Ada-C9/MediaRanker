require "test_helper"
require "pry"

describe User do

  describe 'validations' do
    before do
      @user = User.new(username: 'test username' )
    end

    it 'is valid when all fields are present' do
      result = @user.valid?
      result.must_equal true
    end

    it 'is invalid without a username' do
      @user.username = nil
      result = @user.valid?
      result.must_equal false
      @user.errors.messages.must_include :username
    end

    it 'is invalid with a duplicate username' do
      dup_user = User.first
      @user.username = dup_user.username
      result = @user.valid?
      result.must_equal false
      @user.errors.messages.must_include :username
    end

  end

  describe 'relations' do

    it 'has many votes' do
      user = users(:luke)
      user.votes.length.must_equal 5
      user.votes.must_include votes(:book_vote)
      user.votes.must_include votes(:movie_vote)
      user.votes.must_include votes(:album_vote)
    end

    it 'has many works through votes' do
      user = users(:luke)
      user.works.inspect
      user.works.length.must_equal 5
      user.works.must_include works(:kindred)
      user.works.must_include works(:black_panther)
      user.works.must_include works(:american_teen)
    end

  end

end
