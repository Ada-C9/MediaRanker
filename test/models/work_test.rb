require "test_helper"

describe Work do
  describe "validations" do
    before do
      @work = Work.new(category: "album", title: "test album", creator: "Anne", publication_year: 2018, description: "best album")
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

  end

  describe "relations" do
    before do
      @work = Work.create(title: "Test Work")
      @user = User.create(name: "Anne")
    end

    it "can have a count of votes" do
      vote = Vote.create(user_id: @user.id, work_id: @work.id)
      vote_b = Vote.create(user_id: @user.id, work_id: @work.id)
      vote_c = Vote.create(user_id: @user.id, work_id: @work.id)

      result = @work.votes.count
      result.must_equal 3
    end

    it "can be the most popular work" do
      vote = Vote.create(user_id: @user.id, work_id: @work.id)
      vote_b = Vote.create(user_id: @user.id, work_id: @work.id)
      vote_c = Vote.create(user_id: @user.id, work_id: @work.id)

      result = Work.most_popular.id
      result.must_equal @work.id
    end

    it "can be a top ten movie" do

    end

  end
end
