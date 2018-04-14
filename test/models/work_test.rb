require "test_helper"

describe Work do
  let(:work) { Work.new(title: "Title", category: "book") }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must not have a nil title" do
    work.title = nil
    value(work).wont_be :valid?
  end

  it "must not ve valid with an empty title" do
    works(:book_one).title = ""

    works(:book_one).valid?.must_equal false
    works(:book_one).errors.messages.must_include :title
  end

  it "only allows unique titles per category" do
    work.save
    another_work = Work.new(title: "Title", category: "book")

    value(another_work).wont_be :valid?
  end

  describe 'relations' do

    it "has votes through .votes" do
      works(:book_one).votes.count.must_equal 1
    end

  end

  describe 'methods' do

    describe 'vote_count' do
      it "counts number of votes correctly" do
        works(:album_two).vote_count.must_equal 2
        works(:album_two).vote_count.must_be_kind_of Integer

      end

      it "gives 0 if work has no votes" do
        works(:book_ten).vote_count.must_equal 0
      end

    end

    describe 'ordered_by_votes_works' do

      it "sorts work by number of votes in ascending order" do
        Work.ordered_by_votes_works("album").count.must_equal 3
        Work.ordered_by_votes_works("album").first.must_equal works(:album_two)
        Work.ordered_by_votes_works("album").last.must_equal works(:album_three)
      end

    end

    describe 'top_ten' do

      it 'gives the top ten voted works per category' do

      end

    end

    describe 'best_work' do

      it 'gives the top most voted work across all categories' do
        Work.best_work.must_equal works(:album_two)
      end

    end




  end


end
