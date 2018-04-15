require "test_helper"

describe Vote do

  before do
    @work = Work.create!(category: "album", title: "melodrama", creator: "lorde", publication_year: 2017, description: "best albums from Lorde")
    @user = users(:rabbit)
  end

  describe "validations" do

    it "can be created with all fields" do

      vote1 = Vote.new(user_id: @user.id, work_id: @work.id)
      result = vote1.valid?
      result.must_equal true
    end

    it "requires a work id" do
      vote = Vote.new(user_id: @user)
      result = vote.valid?
      result.must_equal false

      vote.errors.messages.must_include :work_id
    end

    it "requires a user id" do

      vote = Vote.new(work_id: @work)
      result = vote.valid?
      result.must_equal false

      vote.errors.messages.must_include :user_id
    end

    it "don't allow user to vote more than once for one work" do
      user = User.new(name: "yellowlion")
      vote = Vote.new(user: user, work: @work)
      vote2 = Vote.new(user: user, work: @work)
      result = vote2.valid?
      result.must_equal false
    end

  end

  describe "relationships" do
    before do
      @user = users(:yellowlion)
      @work = works(:best_album)
      @vote = Vote.new(user_id: @user.id, work_id: @work.id)
    end
    it "has a user" do

      @vote.must_respond_to :user_id
      @vote.user.must_equal @user
      @vote.user_id.must_equal @user.id
    end

    it "has a work" do
      @vote.must_respond_to :work_id
      @vote.work_id.must_equal @work.id
    end

  end

end
