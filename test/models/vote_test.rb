require "test_helper"

describe Vote do

  describe 'Validations' do
    # nominal
    it "is valid when all fields are present" do
      votes(:vote_0).valid?.must_equal true
    end

    # presence
    it "is invalid without a work_id" do
      votes(:vote_0).work_id = nil

      votes(:vote_0).valid?.must_equal false
      votes(:vote_0).errors.messages.must_include :work
    end

    it "is invalid without a user_id" do
      votes(:vote_0).user_id = nil

      votes(:vote_0).valid?.must_equal false
      votes(:vote_0).errors.messages.must_include :user
    end

    it "is invalid without both work_id and user_id" do
      votes(:vote_0).work_id = nil
      votes(:vote_0).user_id = nil

      votes(:vote_0).valid?.must_equal false
      votes(:vote_0).errors.messages.must_include :work
      votes(:vote_0).errors.messages.must_include :user
    end

    # uniqueness
    it "is invalid if a vote with same work_id and user_id already exists" do
      vote = Vote.new(work_id: votes(:vote_0).work_id, user_id: votes(:vote_0).user_id)

      vote.valid?.must_equal false
      vote.errors.messages.must_include :work_id
    end
  end

  describe 'Relations' do
    it "belongs to a work" do
      votes(:vote_0).work.must_equal works(:work_1)
    end

    it "belongs to a user" do
      votes(:vote_0).user.must_equal users(:user_1)
    end
  end

end
