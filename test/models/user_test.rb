require "test_helper"

describe User do

  describe "validations" do

    it "must have a username" do
      new_user = User.new

      result = new_user.valid?

      result.must_equal false
    end

  end # validations

  describe "relationships" do

    it "connects vote and vote id" do

      vote_one = votes(:vote_one)

      user_one = users(:user_one)

      user_one.votes.must_include vote_one

    end

    it "connects works and works ids" do

      user = users(:user_one)

      works = [works(:poodr), works(:one_beat)]

      works_list = user.votes.map do |vote|
        vote.work
      end

      works_included = false

      works_list.each do |work|
        works_included = works.include?(work)
      end

      works_included.must_equal true

    end

  end # relationships

  describe "business logic" do

    describe "#format_date" do

      it "returns the date the user joined in the format MMM DD, YYYY" do

        user = users(:user_one)

        formatted_date = user.format_date
        formatted_date = formatted_date.split

        Date::ABBR_MONTHNAMES.must_include formatted_date[0]
        (1..31).must_include formatted_date[1].to_i
        formatted_date[2].length.must_equal 4
        formatted_date[2].to_i.must_equal Date.today.year

      end

    end # format_date

  end # business logic

end
