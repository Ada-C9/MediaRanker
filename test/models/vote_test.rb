require "test_helper"
require 'pry'

describe Vote do
  let(:user) { User.new name: "jane" }
  let(:work) { Work.new title: "doodoo", category: "book" }
  let(:vote) { Vote.new user_id: user.id, work_id: work.id }

  describe "validations" do
    it "must be valid" do
      # value(vote).must_be :valid?
    end

    it "must have a user_id" do
      vote.user_id = nil

      vote.valid?.must_equal false
      vote.errors.must_include :user_id
    end

    it "must have a work_id" do
      vote.work_id = nil

      vote.valid?.must_equal false
      vote.errors.must_include :work_id
    end

  end

  describe "relations" do
    # work = Work.all.sample
    # votes = Vote.where(work_id: work.id)
    #
    # work.votes.count.must_equal votes.count
  end

end
