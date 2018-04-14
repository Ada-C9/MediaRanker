require "test_helper"
describe User do


  describe 'Validations' do
    # nominal
    it "is valid when all fields are present" do
      users(:user1).must_be :valid?
    end

    # presence
    it "is invalid without a name" do
      users(:user1).username = nil

      users(:user1).valid?.must_equal false
      users(:user1).errors.messages.must_include :username


    end

    it "is invalid if name is a string with only spaces" do
      users(:user1).username = "    "
      users(:user1).valid?.must_equal false
      users(:user1).errors.messages.must_include :username
    end

    # uniqueness
    it "is invalid if an user with same name already exists" do
      user = User.new(username: users(:user1).username,date_joined: Date.today)

      user.valid?.must_equal false
      user.errors.messages.must_include :username
    end

    # length
    it "is invalid if length of name is smaller than 1" do
      users(:user1).username = ""

      users(:user1).valid?.must_equal false
      users(:user1).errors.messages.must_include :username
    end
  end

  describe 'Relations' do
    it "can access votes through 'votes'" do
      users(:user2).votes.count.must_equal 5
    end

    it "can destroy votes when destroy user" do
      votes = users(:user1).votes

      votes.count.must_equal 3

      users(:user1).destroy

      votes.must_equal []
    end
  end

  describe 'Methods' do

    describe 'count_votes' do
      it 'returns the right vote count' do
        users(:user1).count_vote.must_equal 3
      end

      it 'returns 0 if no vote exists' do
        users(:user9).count_vote.must_equal 0
      end
    end

  end

end
