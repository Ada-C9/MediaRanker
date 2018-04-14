require "test_helper"

describe User do

  describe "validations" do

    before do
      @user = User.create!(name: 'test user')
    end

    it "can be created" do
      result = @user.valid?

      result.must_equal true
    end

    it "is invalid without a name" do
      @user.name = nil

      result = @user.valid?

      result.must_equal false
    end

    it "cannot be created if another user with the same name exists" do
      duplicate_user = User.new(name: 'test user')

      result = duplicate_user.valid?

      result.must_equal false
    end

  end

  describe "relationships" do

    it "has many votes" do
      user = users(:one)

      user.votes.each do |vote|
        vote.must_be_instance_of Vote
      end

    end

    it "returns a list of works the user has voted for" do
      user = users(:one)

      user.upvoted_works.each do |work|
        work.must_be_kind_of Work
      end
      
    end

  end

end
