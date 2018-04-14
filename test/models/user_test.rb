require "test_helper"

describe User do

  describe "validations" do
    it "should be related to many votes " do
      user = users(:wini)
      vote = Vote.create!(user_id: user.id, work_id: works(:movie).id)
      vote2 = Vote.create!(user_id: user.id, work_id: works(:book).id)


      user.vote_ids.must_include vote.id
      user.vote_ids.must_include vote2.id
    end
  end

  describe "methods in model" do
    it "shoul return the correct number of votes for each user" do
      user = users(:ana)

      user.total_votes.must_equal 0


      Vote.create!(user_id: user.id, work_id: works(:movie).id)

      user.total_votes.must_equal 1
    end

  end
end
