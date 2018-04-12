require "test_helper"

describe Work do

  describe "validations" do
    it "can be created with all fields" do
      work = works(:best_movie)
      result = work.valid?
      result.must_equal true
    end

    it "must have a title" do
      work = works(:best_album)
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :title
    end

    it "requires a unique title" do

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

  describe 'popular_works' do
    user = User.first
    work = Work.first
    vote = Vote.new(work: work, user: user)

    work2 = Work.first 

    it "identifies the top 10" do
      Work.top_ten_albums("album").first.title.must_equal "Harry Potter"
    end
  end

  # describe "top " do
  #   user = User.first
  #   work = Work.first
  #
  #   user1 = User.last
  #   work1=Work.last
  #
  #   user2=User.first + 1
  #
  #   vote = Vote.new(work: work, user: user)
  #   vote = Vote.new(work: work1, user: user1)
  #   vote2 = Vote.new(work: work, user: user2)
  #
  #   it "finds the most voted for work" do
  #     Work.top.title.must_equal "Harry Potter"
  #   end
  # end

end
