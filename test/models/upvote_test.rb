require "test_helper"

describe Upvote do
  describe "relations" do
    it "must be valid" do
      upvote = upvotes(:one)

      value(upvote).must_be :valid?
    end

    it "must not have invalid user" do
      upvote = upvotes(:one)
      upvote.user = nil
      upvote.valid?.must_equal false
      upvote.errors.must_include :user
    end

    it "must not have invalid work" do
      upvote = upvotes(:one)
      upvote.work = nil
      upvote.valid?.must_equal false
      upvote.errors.must_include :work
    end

    it "establishes relationships" do
      work = works(:pride)
      user = users(:billy)
      upvote = Upvote.create! work: work, user: user

      upvote.work.must_equal work
      upvote.user.must_equal user
    end

    it "must have a unique combination of user and work" do
      work = works(:parable)
      user = users(:billy)

      first = Upvote.create! work: work, user: user
      first.valid?.must_equal true

      second = Upvote.create work: work, user: user
      second.valid?.must_equal false
      second.errors.messages.must_include :user_id
    end
  end

  describe "self.featured" do
    it "returns the highest voted item" do
      work = works(:kindred)
      top_work = Upvote.featured_work

      top_work.must_equal work
    end
  end

end
