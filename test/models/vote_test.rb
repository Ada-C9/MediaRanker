require "test_helper"

describe Vote do

  describe 'Validations' do
    # nominal
    it "is valid when all fields are present" do
      votes(:one).valid?.must_equal true
    end

    # presence
    it "is invalid without a work_id" do
      votes(:one).work_id = nil

      votes(:one).valid?.must_equal false
      votes(:one).errors.messages.must_include :work
    end

    it "is invalid without a user_id" do
      votes(:one).user_id = nil

      votes(:one).valid?.must_equal false
      votes(:one).errors.messages.must_include :user
    end

    it "is invalid without both work_id and user_id" do
      votes(:one).work_id = nil
      votes(:one).user_id = nil

      votes(:one).valid?.must_equal false
      votes(:one).errors.messages.must_include :work
      votes(:one).errors.messages.must_include :user
    end

    # uniqueness
    it "is invalid if a vote with same work_id and user_id already exists" do
      vote = Vote.new(work_id: votes(:one).work_id, user_id: votes(:one).user_id)

      vote.valid?.must_equal false
      vote.errors.messages.must_include :work_id
    end
  end

  describe 'Relations' do
    it "belongs to a work" do
      votes(:one).work.must_equal works(:aja)
    end

    it "belongs to a user" do
      votes(:one).user.must_equal users(:user_1)
    end
  end

end
