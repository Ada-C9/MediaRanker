require "test_helper"

describe Work do

  describe "create new work" do
    describe "relations" do
      it "must be valid" do
        work = works(:pride)
        value(work).must_be :valid?
      end

      it "must only have a valid title" do
        work = works(:pride)

        work.title = ""
        work.valid?.must_equal false
        work.errors.must_include :title

        work.title = " "
        work.valid?.must_equal false
        work.errors.must_include :title

        work.title = nil
        work.valid?.must_equal false
        work.errors.must_include :title

        work.title = "I, Tonya"
        work.valid?.must_equal false
        work.errors.must_include :title
      end

      it "must only have a valid creator" do
        work = works(:help)

        work.creator = ""
        work.valid?.must_equal false
        work.errors.must_include :creator

        work.creator = nil
        work.valid?.must_equal false
        work.errors.must_include :creator

        work.creator = " "
        work.valid?.must_equal false
        work.errors.must_include :creator
      end

      it "must only have a valid publication year" do
        work = works(:itonya)

        work.publication_year = ""
        work.valid?.must_equal false
        work.errors.must_include :publication_year

        work.publication_year = nil
        work.valid?.must_equal false
        work.errors.must_include :publication_year

        work.publication_year = -1
        work.valid?.must_equal false
        work.errors.must_include :publication_year

        work.publication_year = Date.current.year+1
        work.valid?.must_equal false
        work.errors.must_include :publication_year
      end

    end

    describe "voting" do
      it "registers new votes" do
        work = works(:pride)
        vote = Upvote.create! work: work, user: users(:billy)
        work.upvotes.last.must_equal vote
      end
    end
  end

  describe "get_count" do
    it "can show works vote count when zero" do
      work = works(:help)
      work.get_count.must_equal 0
    end

    it "can show work's vote count" do
      work = works(:pride)
      work.get_count.must_equal 1
    end

    it "can track work's count as votes increase" do
      work = works(:pride)
      Upvote.create! work: work, user: users(:billy)
      work.get_count.must_equal 2
    end
  end

  describe "self.get_works(type)" do
    it "returns works of the same category" do
      works = Work.get_works("Book")
      works.length.must_equal 2

      works = Work.get_works("Album")
      works.length.must_equal 2

      works = Work.get_works("Movie")
      works.length.must_equal 2
    end
  end

  describe "self.get_sorted_works(type)" do
    it "returns sorted works of the same category" do
      works = Work.get_sorted_works("Book")
      works.first.must_equal works(:pride)
      works.last.must_equal works(:poodr)
    end
  end

end
