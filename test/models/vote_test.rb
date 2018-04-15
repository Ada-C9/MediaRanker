require "test_helper"

describe Vote do

  describe "validations" do

    it "is unique for any given work-user combination" do
      poodr = works(:poodr)

      user_one = users(:user_one)

      another_vote_for_poodr = Vote.new

      another_vote_for_poodr.work = poodr

      another_vote_for_poodr.user = user_one

      result = another_vote_for_poodr.valid?

      result.must_equal false

    end

  end # validations

  describe "relationships" do

    it "connects work and work id" do

      poodr = works(:poodr)

      vote_one = votes(:vote_one)

      vote_one.work.must_equal poodr

    end

    it "connects user and user id" do

      user_one = users(:user_one)

      vote_one = votes(:vote_one)

      vote_one.user.must_equal user_one

    end

  end # relationships

  describe "business logic" do

    describe "#format_date" do

      it "returns the date the vote was created in the format MMM DD, YYYY" do
        vote = votes(:vote_one)
        formatted_date = vote.format_date
        formatted_date = formatted_date.split
        Date::ABBR_MONTHNAMES.must_include formatted_date[0]
        (1..31).must_include formatted_date[1].to_i
        formatted_date[2].length.must_equal 4
        formatted_date[2].to_i.must_equal Date.today.year

      end

    end # format_date

  end # business logic

end
