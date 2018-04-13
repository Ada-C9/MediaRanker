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
    it "finds the work with more votes" do
      user = users(:yellowlion)
      user2 = users(:rabbit)
      user3 = users(:littlepony)
      vote = Vote.create(work: works(:harrypotter), user: user)
      vote1 = Vote.create(work: works(:harrypotter), user: user2)
      vote2 = Vote.create(work: works(:best_movie), user: user3)

      Work.top.title.must_equal works(:harrypotter).title
    end

  end
end
