require "test_helper"

describe User do

  describe "relations" do
    it "must be valid" do
      user = users(:lily)
      value(user).must_be :valid?
    end

    it "must only have a valid username" do
      user = users(:lily)

      user.username = ""
      user.valid?.must_equal false
      user.errors.must_include :username

      user.username = " "
      user.valid?.must_equal false
      user.errors.must_include :username

      user.username = nil
      user.valid?.must_equal false
      user.errors.must_include :username

      user.username = "Millz"
      user.valid?.must_equal false
      user.errors.must_include :username
    end

    it "registers new votes" do
      user = users(:lily)
      work = works(:poodr)
      vote = Upvote.create! work: work, user: user
      user.upvotes.last.must_equal vote
    end
  end

  describe "get_count" do
    it "can show user's vote count when zero" do
      user = users(:billy)
      user.get_count.must_equal 0
    end

    it "can show user's vote count" do
      user = users(:lily)
      user.get_count.must_equal 1
    end

    it "can track user's count as votes increase" do
      user = users(:lily)
      Upvote.create! work: works(:help), user: user
      user.get_count.must_equal 2
    end
  end
end
