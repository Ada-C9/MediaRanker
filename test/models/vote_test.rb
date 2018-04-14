require "test_helper"

describe Vote do
  before do
    @work = Work.create!(category: "movie", title: "Wonder", creator: "Stephen Chbosky", publication_year: 2017, description: "great movie")
  end
  describe "validations" do
    it "must be valid" do
      user = User.create!(name: "Dikla")

      vote = Vote.new(user: user, work: @work)
      result = vote.valid?
      result.must_equal true
    end

    it "must be invalid without work id" do
      user = User.create!(name: "Dikla")

      vote = Vote.new(user: user)
      result = vote.valid?
      result.must_equal false
    end

    it "must be invalid without user id" do
      user = User.create!(name: "Dikla")

      vote = Vote.new(work: @work)
      result = vote.valid?
      result.must_equal false
    end
  end

  describe "relations" do
    before do
      @work = works(:best_book)
      @user = users(:dikla)
      @vote = Vote.new(user_id: @user.id, work_id: @work.id)
    end

    it "has a work id" do
      @vote.must_respond_to :work_id
    end

    it "has a user id" do
      @vote.must_respond_to :user_id
    end
  end
end
