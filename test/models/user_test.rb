require "test_helper"

describe User do

  describe 'Validations' do
    # nominal
    it "is valid when all fields are present" do
      users(:user_1).valid?.must_equal true
    end

    # presence
    it "is invalid without a name" do
      users(:user_1).name = nil

      users(:user_1).valid?.must_equal false
      users(:user_1).errors.messages.must_include :name
    end

    it "is invalid if name is a string with only spaces" do
      users(:user_1).name = "    "

      users(:user_1).valid?.must_equal false
      users(:user_1).errors.messages.must_include :name
    end

    # uniqueness
    it "is invalid if an user with same name already exists" do
      user = User.new(name: users(:user_1).name)

      user.valid?.must_equal false
      user.errors.messages.must_include :name
    end

    # length
    it "is invalid if length of name is smaller than 1" do
      users(:user_1).name = ""

      users(:user_1).valid?.must_equal false
      users(:user_1).errors.messages.must_include :name
    end
  end

  describe 'Relations' do
    it "can access votes through 'votes'" do
      users(:user_11).votes.count.must_equal 11
    end

    it "can destroy votes when destroy user" do
      votes = users(:user_11).votes

      votes.count.must_equal 11

      users(:user_11).destroy

      votes.must_equal []
    end
  end

  describe 'Methods' do

    describe 'total_votes' do
      it 'returns the right vote count' do
        users(:user_11).total_votes.must_equal 11
      end

      it 'returns 0 if no vote exists' do
        users(:user_12).total_votes.must_equal 0
      end
    end

  end

end
