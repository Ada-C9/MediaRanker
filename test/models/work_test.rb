require "test_helper"


describe Work do

  describe "validations" do

    it "can be created with all required fields" do
      work = Work.create!(category: "album", title: "book11", creator: "author" ,publication_year: 1960,description:"good book")
      work.must_be :valid?
    end


    it "requires a title" do
      w = Work.new
      w.wont_be :valid?
      w.errors.messages.must_include :title
    end

    it "requires a category" do
      w = Work.new
      w.wont_be :valid?
      w.errors.messages.must_include :category
    end
  end

  describe "relations" do
    it "responds to votes and can be update the vote " do
      # arrange
      w = works(:book9)
      w.must_respond_to :votes
      w.votes.must_be :empty?
      w.votes.count.must_equal 0
      vote = Vote.create!(date: Date.today, work_id: w.id, user_id: users(:user1).id)

      # act
      w.votes << vote

      #assert
      w.votes.count.must_equal 1
      w.votes.must_include vote
    end

    it "can have multiple votes" do
      # arrange
      w = works(:book9)
      w.votes.must_be :empty?
      w.votes.count.must_equal 0

      vote1 = Vote.create!(date: Date.today, work_id: w.id, user_id: users(:user1).id)
      w.votes << vote1

      vote2 = Vote.create!(date: Date.today, work_id: w.id, user_id: users(:user2).id)

      # act
      w.votes << vote2

      #assert
      w.votes.count.must_equal 2
      w.votes.must_include vote1
      w.votes.must_include vote2
    end

    # Test dependent destroy relationship
    it "can destroy dependent relationship to vote" do
      # arrange
      w = works(:book3)

      #
      # act
      w.destroy!

      #assert
      Vote.all.wont_include works(:book3)

    end
  end

  describe "custom public methods" do
    describe "top_work" do
      it "returns top voted work" do

        w = works(:hunger)
        Work.top_work.must_equal w
      end
    end

    describe "top_ten" do
      it "returns the top ten media in a category that has more than 10 items" do

        top_books = Work.top_ten("book")

        top_books.first.must_equal works(:hunger)
      end

      it "returns all media in a category that has fewer than 10 items" do

        top_albums = Work.top_ten("album")

        top_albums.count.must_equal 2

        top_albums.must_equal [works(:book3), works(:book4)]
      end

      it "returns an empty array if category has no works" do
        top_albums = Work.top_ten("movie")
        top_albums.must_be :empty?
      end
    end
  end

end
