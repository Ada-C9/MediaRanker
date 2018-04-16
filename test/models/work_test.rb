require "test_helper"

describe Work do
  describe "validations" do
    before do
      @work = Work.new(title: "Something Great", category: "album")
    end

    it "can be created with all required fields" do
      result = @work.valid?

      result.must_equal true
    end

    it "is invalid without a title" do
      @work.title = nil

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

    it "is invalid without a category" do
      @work.category = nil

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :category
    end

    it "is invalid with a duplicate title and category" do
      copy_work = Work.first
      @work.title = copy_work.title
      @work.category = copy_work.category

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

    it "can be created with duplicate title but different category" do
      copy_work = Work.first
      @work.title = copy_work.title
      @work.category = "movie"

      result = @work.valid?

      result.must_equal true
    end
  end

  describe "relations" do
    before do
      @work = Work.create!(title: "Something Great", category: "album")
    end

    it "connects votes and vote_ids" do
      vote = Vote.create!(user: User.first, work: @work)

      @work.votes.must_include vote
      @work.vote_ids.must_include vote.id
    end

    it "connects users and user_ids" do
      user = users(:patty)
      vote = Vote.create!(user: user, work: @work)

      @work.users.must_include user
      @work.user_ids.must_include user.id
    end
  end
end
