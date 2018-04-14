require "test_helper"

describe User do
  before do
  end

  describe 'relations' do
    let(:user) { User.first }

    it 'relates works and users' do
      work = Work.first

      user.works << work
      user.work_ids.must_include work.id
    end

    it 'relates vote and vote_id' do
      vote = Vote.create!(user_id: user.id, work_id: Work.first.id)

      user.vote_ids.must_include vote.id
    end
  end

  describe 'validations' do
    before do
      @user = User.new(username: 'Username')
    end

    it 'cannot be created without a username' do
      @user.username = nil
      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :username
    end

    it 'cannot be created if the username has been taken' do
      # I know this situation will not happen on the website, but maybe can be useful if reading from a CSV or creating users through the console.
      @user.save
      username = @user.username
      user2 = User.new(username: username)

      result = user2.valid?

      result.must_equal false
    end

    it 'can be created with all required fields' do
      result = @user.valid?
      result.must_equal true
    end
  end
end
