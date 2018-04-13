require "test_helper"

describe User do
  describe 'validations' do

    before do
      @user = User.new(name: 'test-user', joined: 2017-2-2)
    end

    it 'is valid when all fields are present' do

      #act
      result = @user.valid?

      result.must_equal true
    end

    it 'is invalid without a name' do
      #arrange
      @user.name = nil

      #act
      result = @user.valid?

      #assert
      result.must_equal false
      @user.errors.messages.must_include :name
    end

    describe 'relations' do
      it 'can set the vote through "user"' do
        # Create two models
        user = User.create!(name: "test user")
        vote = Vote.new(user: user)

        # Make the models relate to one another
        vote.user = user

        # author_id should have changed accordingly
        vote.user_id.must_equal user.id
      end
    end

  end
end
