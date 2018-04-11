require "test_helper"

describe User do
  describe "Validations" do
    before do
      @user = User.first
    end

    it "is valid when the user has a name" do
      result = @user.valid?
      result.must_equal true
    end

    it "is invalid when the user do not have a name" do
      user = User.new
      user.valid?.must_equal false
    end

  end

  describe "relatios" do
    before do
      @user = users(:coco)
    end

    it "connects votes" do
      vote = Vote.first
      @user.votes << vote
      @user.vote_ids.must_include vote.id
    end
  end
end
