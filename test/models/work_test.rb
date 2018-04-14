require "test_helper"

describe Work do
  let(:work) { Work.new(category: "movie", title: "Selma")}

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must be invalid without a category" do
    work.category = nil
    value(work).wont_be :valid?
  end

  it "must be invalid without a title" do
    work.title = nil
    value(work).wont_be :valid?
  end

  it "must be valid with a supported category type" do
    categories = ["movie", "book", "album"]
    categories.each do |category|
      work.category = category
      value(work).must_be :valid?
    end
  end

  it "must be invalid without a supported category type" do
    work.category = "gdfhjgfhjd"
    value(work).wont_be :valid?
  end


  describe "relations" do
    it "must have votes" do
      work = works(:best_book)
      work.votes.count.must_equal 1
    end

    it "must have no votes" do
      work = works(:worst_album)
      work.votes.count.must_equal 0
    end
  end

  describe "model methods" do
    it "find spotlight" do
      user1 = users(:dikla)
      user2 = users(:brenda)
      user3 = users(:luxi)
      vote1 = Vote.create(work: works(:best_album), user: user1)
      vote2 = Vote.create(work: works(:best_album), user: user2)
      vote3 = Vote.create(work: works(:best_book), user: user3)

      Work.spotlight.title.must_equal works(:best_album).title
    end
  end


end
