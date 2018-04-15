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

end
