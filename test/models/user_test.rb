require "test_helper"

describe User do
  describe "validations" do
    before do
      @user = User.new(username: "me")
    end

    it "can be created with all required fields" do
      result = @user.valid?

      result.must_equal true
    end

    it "is invalid without a username" do
      @user.username = nil

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :username
    end

    it "is invalid with a duplicate username" do
      copy_user = User.first
      @user.username = copy_user.username

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :username
    end
  end

  describe "relations" do
    before do
      @user = User.create!(username: "me")
    end

    it "connects votes and vote_ids" do
      vote = Vote.create!(user: @user, work: Work.first)

      @user.votes.must_include vote
      @user.vote_ids.must_include vote.id
    end

    it "connects works and work_ids" do
      fav_work = works(:graceland)
      vote = Vote.create!(user: @user, work: fav_work)

      @user.works.must_include fav_work
      @user.work_ids.must_include fav_work.id
    end
  end
end
