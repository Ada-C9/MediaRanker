require "test_helper"

describe User do
  describe 'validations' do
    before do
      @user = User.new(username: 'test', joindate: 2017-04-19)
    end

    it "is valid when all fields are present" do
      result = @user.valid?
      result.must_equal true
    end
  end

  it 'is invalid without a username' do
    @user.username = nil
    result = @user.valid?
    result.must_equal false
    @user.errors.messages.must_include :username
  end

  it 'is invalid without a joindate' do
    @user.joindate = nil
    result = @user.valid?
    result.must_equal false
    @user.errors.messages.must_include :joindate
  end

  describe User do
    describe 'relations' do
      it "can have a vote" do
        user = users(:potterhead)
        user.vote_id.must_equal votes(:vote_2)
      end
    end
  end
end
