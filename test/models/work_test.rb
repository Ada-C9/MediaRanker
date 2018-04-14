require "test_helper"

describe Work do

  describe "validations" do
    it "can be created with all fields" do
      work = works(:the_lure)
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
      work = works(:best_album)
      work.votes.count.must_equal 1
    end

    it "does not have votes" do
      work = works(:city_ghosts)
      work.votes.count.must_equal 0
    end
  end

  describe "custom methods" do
    before do
      @work = works(:harrypotter)

    end

    it 'calculates the total votes for a work' do
      total = @work.total_votes
      total.must_equal 3

    end

    it "finds the work overall categories with more votes (media_spotlight)" do

      Work.top.title.must_equal works(:harrypotter).title
    end

    it 'returns an array of the first top-ten movies' do

      Work.top_ten_movies.must_be_kind_of Array

    end

    it 'returns the FIRST ten movies voted for the Top-Ten Movies' do

      array_top_ten_movies = [works(:harrypotter), works(:the_lure), works(:dark_times),
        works(:the_square), works(:lucky), works(:lady_bird), works(:frozen),
      works(:goodtime), works(:flinstones), works(:blackpanther)]

      # The 11th movie has the same amount of votes as the 10th movie, but the method
      # considers the order of voting, so returns the first ten movies voted.

      expected_false = array_top_ten_movies.include?(works(:thor))

      result_false = Work.top_ten_movies.include?(works(:thor))

      result_false.must_equal expected_false

    end


     it 'returns an empty array when no works of category books' do

      Work.top_ten_books.must_equal []
     end


  end
end
