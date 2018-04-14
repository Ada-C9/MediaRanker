require "test_helper"

describe Work do
  let(:work) { works(:work_one) }

  describe 'validations' do
    it "must be valid with all valid inputs" do
      work.valid?.must_equal true
    end

    it "does not accept a nil category input" do
      work.category = nil
      work.valid?.must_equal false
    end

    it "must not accept an empty string category input" do
      work.category = ""
      work.valid?.must_equal false
    end

    it "must require unique title by category" do
      work
      new_work = Work.create(category: "book", title: "book title 1")
      new_work.valid?.must_equal false

      album = works(:work_eleven)
      new_album = Work.create(category: "album", title: "album title 1")
      new_album.valid?.must_equal false

      movie = works(:work_sixteen)
      new_movie = Work.create(category: "movie", title: "movie title 1")
      new_movie.valid?.must_equal false
    end

    it "does not accept a nil title input" do
      work.title = nil
      work.valid?.must_equal false
    end

    it "must not accept an empty string title input" do
      work.title = ""
      work.valid?.must_equal false
    end

  end

  describe 'relations' do
    it "must have a relationship between work and votes" do
      work.votes.count.must_equal 4
    end

    it "must respond to votes" do
      work.must_respond_to :votes
    end
  end


  describe 'vote_count' do
    it "counts the votes" do
      work.votes.count.must_be_kind_of Integer

      work.vote_count.must_equal 4
    end

    it "returns 0 for works with no votes" do
      works(:work_three).vote_count.must_equal 0
    end
  end

  describe 'ordered_works' do
    it "returns the work with the highest votes per category" do

      Work.ordered_works("album").first.must_equal works(:work_eleven)

      Work.ordered_works("book").first.must_equal works(:work_one)

      Work.ordered_works("movie").first.must_equal works(:work_twenty)

    end
  end

  # describe 'top_ten' do
  # i have no idea how to test this and  my fixture does not have enough votes and it is 9pm on friday
  # end
  #
  describe 'media_spotlight' do
    it "returns the work with the higest vote count" do
      Work.media_spotlight.must_equal works(:work_one)
    end
  end
end
