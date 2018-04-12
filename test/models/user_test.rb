require "test_helper"

describe User do
  describe 'validations' do
    before do
      @user = User.new(username: 'test')
    end

    it "is valid when all fields are present" do
      result = @user.valid?
      result.must_equal true
    end

    it "username less than 2 characters is invalid" do
      @user.username = "1"
      result = @user.valid?
      result.must_equal false
    end

    it "username more than 25 characters is invalid" do
      @user.username = "12"*13
      result = @user.valid?
      result.must_equal false
    end

    it 'is invalid without a username' do
      @user.username = nil
      result = @user.valid?
      result.must_equal false
      @user.errors.messages.must_include :username
    end

    describe 'relations' do
      it "can have a vote" do
        user = users(:potterhead)
        user.id.must_equal votes(:vote_2).user_id
      end
    end
  end
end
