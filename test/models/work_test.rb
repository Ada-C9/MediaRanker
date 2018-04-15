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
      # votes for harrypotter
      vote = votes(:vote1, :vote4, :vote5)
      result = vote.length

      @work.total_votes.must_equal result

    end

    it "finds the work overall categories with more votes (media_spotlight)" do
      # in votes fixtures, harrypotter has the most votes.
      result_media_spotlight = @work.title

      Work.media_spotlight.title.must_equal result_media_spotlight
    end

    it 'returns an array of the first top-ten movies' do

      Work.top_ten_movies.must_be_kind_of Array

      Work.top_ten_movies.length.must_equal 10

    end


    it 'returns an empty array when no works of category books' do
      # in works fixtures there are no works for books (only fixtures for albums and movies)
      Work.top_ten_books.must_equal []
    end

    it 'returns only the FIRST ten movies voted even when more works with same amount of votes' do
      array_top_ten_movies = [works(:harrypotter), works(:the_lure), works(:dark_times),
        works(:the_square), works(:lucky), works(:lady_bird), works(:frozen),
        works(:goodtime), works(:flinstones), works(:blackpanther)]

      # The 11th movie has the same amount of votes as the 10th movie, but the method
      # considers the order of voting, so returns the first ten movies voted.
      # in this test the fixture of movie thor has the same number of votes as blackpanther,
      # but thor was created at last.

        expected_false = array_top_ten_movies.include?(works(:thor))

        result_false = Work.top_ten_movies.include?(works(:thor))

        result_false.must_equal expected_false
    end

  end

end
