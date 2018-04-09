require "test_helper"

describe User do
  before do
  end

  describe 'relations' do
    it 'relates users and works' do
      work = Work.first
      user = User.first

      user.works << work
      user.work_ids.must_include work.id
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
    end

    it 'can be created with all required fields' do
      result = @user.valid?
      result.must_equal true
    end
  end
end
