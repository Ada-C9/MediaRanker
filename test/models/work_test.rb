require "test_helper"

describe Work do
  before do
    @user = users(:dan)
    @work = works(:metz)
    @vote = Vote.create(user_id: @user.id, work_id: @work.id)
    @user1 = users(:europa)
  end
  it "exists" do
    work = Work.first
    result = work.valid?

    work.must_be_kind_of Work
    result.must_equal true
  end

  describe "relations" do
    it "matches work to user" do
      result = @work.voted_users

      result.must_include users(:dan)
    end

    it "destroys a vote if work is deleted" do

      vote_id = @vote.id
      work_id = @work.id

      @work.destroy

      proc{ Work.find(work_id)}.must_raise
      proc{Vote.find(vote_id)}.must_raise
    end

  end

  describe "validations" do
    it "disallows a blank title" do
      result = Work.new(title: "").valid?

      result.must_equal false
    end

    it "disallows a duplicate title with the same creator" do
      result = Work.new(title: @work.title, category: @work.creator).valid?

      result.must_equal false
    end

    it "allows a duplicate title with the same category" do
      result = Work.new(title: @work.title, category: @work.category, creator: "Me").valid?

      result.must_equal true
    end

    it "validates category" do
      result = Work.new(title: @work.title).valid?

      result.must_equal false
    end

  end

  describe "methods" do
    describe 'self#books' do
      it "lists all books" do
        result = Work.books
        expected_value = Work.where(category: "book")

        result.must_equal expected_value
      end
    end

    describe 'self#movies' do
      it "lists all movies" do
        result = Work.movies
        expected_value = Work.where(category: "movie")

        result.must_equal expected_value
      end
    end

    describe 'self#albums' do
      it "lists all albums" do
        result = Work.albums
        expected_value = Work.where(category: "album")
        result.must_equal expected_value
      end
    end

    # describe 'vote_count logic' do
    before do
      category = "book"
      work_array = [works(:one), works(:two), works(:three), works(:four), works(:five), works(:six), works(:seven), works(:eight), works(:nine), works(:ten)]

      work_array.each do |work|
        user = users(:europa)
        a = Vote.new
        a.user_id = user.id
        a.work_id = work.id
        if a.save
          print "."
        end
      end

      vote = Vote.create(user_id: users(:blah).id, work_id: works(:three).id)

      @result = Work.top_ten(category)

      @expected_result = Work.where(category: category).order(vote_count: :desc).limit(10)
    end

    describe 'self#top_ten' do

      it "lists top ten books" do
        @result.must_equal @expected_result
        @result.length.must_equal 10
      end

      it "puts the most voted item first" do
        expected_result = works(:three)


        @result.first.must_equal expected_result
      end

      it "does not include lowest value" do
        @result.wont_include :metz
      end

    end

    describe 'self#spotlight' do
      it "lists all albums" do
        result = Work.albums
        expected_value = Work.where(category: "album")

        result.must_equal expected_value
      end
    end


  end
end
