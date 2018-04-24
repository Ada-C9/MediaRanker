require "test_helper"

describe Work do

  describe "relashionship" do
    before do
      @work = works(:movie)
    end
    it "should be related to many votes " do

      vote = Vote.create!(user_id: users(:wini).id, work_id: @work.id)
      vote2 = Vote.create!(user_id: users(:ana).id, work_id: @work.id)

      @work.vote_ids.must_include vote.id
      @work.vote_ids.must_include vote2.id
    end

    it "Title can not be nil" do
      @work.title = nil
      result = @work.valid?

      result.must_equal false
    end

    it "work can not have the same title than other one" do
      work2 = Work.new(title: @work.title)
      result = work2.valid?

      result.must_equal false

    end
  end

  describe "methods in model" do
    it "shoul return the correct number of votes for each work" do
      work = works(:movie)

      work.total_votes.must_equal 0

      Vote.create!(user_id: users(:wini).id, work_id: work.id)

      work.total_votes.must_equal 1
    end

  end
end
