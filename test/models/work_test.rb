require "test_helper"

describe Work do

  describe "validations" do

    it "must have a title" do
      new_work = Work.new

      result = new_work.valid?

      result.must_equal false
    end

  end # validationts

  describe "relationships" do

    it "connects vote and vote id" do

      vote_one = votes(:vote_one)

      poodr = works(:poodr)

      poodr.votes.must_include vote_one

    end

    it "connects users and users' ids" do

      poodr = works(:poodr)

      voters = [users(:user_one), users(:user_two)]

      users = poodr.votes.map do |vote|
        vote.user
      end

      users_included = false

      users.each do |user|
        users_included = voters.include?(user)
      end

      users_included.must_equal true

    end

  end # relationships

  describe "business logic" do

    describe "#upvote" do

      

    end # upvote

  end # business logic

end
