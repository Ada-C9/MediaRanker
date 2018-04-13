require "test_helper"

describe Work do

  describe "validations" do
    it "can be created with all fields" do
      work = works(:best_movie)
      result = work.valid?
      result.must_equal true
    end

    it "must have a title" do
      work = Work.new(title:nil)
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :title
    end

    it "requires a unique title" do
      title = "My Test Book"
      work = Work.create!(title: title)
      work2 = Work.new(title: title)
      work2.wont_be :valid?

    end
  end

  describe "relations" do
    it "must have votes" do
      work = works(:best_movie)
      work.votes.count.must_equal 1
    end

    it "does not have votes" do
      work = works(:watch_worthy)
      work.votes.count.must_equal 0
    end
  end

  describe "custom methods" do
    before do
      @work = works(:harrypotter)
    end

    it 'calculates the total votes for a work' do
      votes = [:vote1, :vote5]
      votes_count = votes.length
      total = @work.total_votes
      total.must_equal 2

    end
    # it "finds the work with more votes" do
    #   let(:user) {User.first }
    #   let(:work) {Work.first }
    #
    #   let(:user1) { User.last }
    #   let(:work1) { Work.last }
    #
    #   let(:user2) {User.first + 1  }
    #
    #   let(:vote) {Vote.new(work: work, user: user) }
    #   let(:vote1) {Vote.new(work: work1, user: user1) }
    #   let(:vote2) {Vote.new(work: work, user: user2) }
    #
    # Work.top.title.must_equal "Harry Potter"
    #
    # end
    # #
    # # it "finds the top ten albums" do
    # # end
    # #
    # # it "finds the top ten movies" do
    # # end
    # #
    # # it "find the top ten books" do
    # # end
    # #
    # # it "no models with category" do
    # #
    # # end
    # #
    # # it "if there is a tie" do
    # #
    # # end

  end
end
