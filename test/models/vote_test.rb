require "test_helper"

describe Vote do

  describe "relationship" do


    it "a vote can just be created with a user and a work id" do
      vote = Vote.new
      result = vote.valid?

      result.must_equal false

      vote = Vote.new(user_id: users(:wini).id)
      result = vote.valid?

      result.must_equal false

      vote = Vote.new(user_id: users(:wini).id, work_id: works(:movie).id)
      result = vote.valid?

      result.must_equal true
    end
  end

  describe "validations" do
    before do
      #we put a bang so it creates and exeption if we do something wrong in there, if this is wrong my book is wrong so I want to know at the beggining if I did this badly. I am not trying to test this.
      @vote = votes(:one)
    end

    it "should not create two votes for the same user and work" do

      vote2 = Vote.new(user_id: @vote.user_id, work_id: @vote.work_id)
      result= vote2.valid?

      result.must_equal false

      vote2 = Vote.new(user_id: users(:ana).id, work_id: @vote.work_id)
      result = vote2.valid?

      result.must_equal true

    end

    it "should be invalid with no user_id" do
      result = @vote.valid?
      result.must_equal true

      @vote.user_id = nil
      result = @vote.valid?

      result.must_equal false

    end
  end


end
