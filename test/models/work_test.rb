require "test_helper"

describe Work do
  let(:work1) { works(:work1) }
  let(:work2) { works(:work2) }
  let(:all_works) { Work.all }
  let(:spotlight) { Work.spotlight }

  describe "validations" do
    it "is valid when all fields are present" do
      work1.valid?.must_equal true
    end

    it "is not valid when required fields are not present" do
      work2.title = nil
      work2.creator = nil
      work2.category = nil

      work2.valid?.must_equal false
      work2.errors.messages.must_include :title
      work2.errors.messages.must_include :creator
      work2.errors.messages.must_include :category
    end

    it "is not valid when work titles are not unique within a category" do
      work2.title = work1.title
      work2.valid?.must_equal false
    end

    it "is valid with identical titles across diff categories" do
      work2.title = work1.title
      work2.category = "movie"
      work2.valid?.must_equal true
    end

    it "is not valid when published field is not 4 digit integer <= current year" do
      work1.published = "not a year"
      work1.valid?.must_equal false

      work1.published = 2020
      work1.valid?.must_equal false

      work1.published = 1
      work1.valid?.must_equal false
    end
  end

  describe "relations" do
    it "can set a vote" do

    end
  end

  describe "custom methods" do
    describe "#make_category_hash" do
      it "returns an array" do
        all_works.make_category_hash.must_be_kind_of Array
      end

      it "returns correct array for valid data" do
        all_works.make_category_hash.must_include "book"
        all_works.make_category_hash.must_include "album"
        all_works.make_category_hash.must_include "movie"
        all_works.make_category_hash.count.must_equal 3
      end

      it "returns empty array if there are no works" do
        all_works.each do |work|
          work.destroy
        end
        all_works.make_category_hash.must_equal []
      end
    end

    describe "#num_runs(array)" do
      it "returns an integer" do
        Work.num_runs(all_works).must_be_kind_of Integer
      end

      it "returns zero if the array is empty" do
        array = []
        Work.num_runs(array).must_equal 0
      end

      # it "returns ArgumentError if an array is not passed as param" do
      #   Work.num_runs("not an array").must_raise ArgumentError
      # end
    end

    describe "#spotlight" do
      it "returns a work" do
        spotlight.must_be_kind_of Work
      end

      it "returns the work with the most votes" do
        spotlight.title.must_equal "most votes work"
      end

      it "returns nil if there are no works" do
        all_works.each do |work|
          work.destroy
        end
        spotlight.must_be_nil
      end
    end

    describe "#sort_by_vote" do
      it "returns an array" do
        Work.sort_by_vote.must_be_kind_of Array
      end

      it "returns the correct number of works" do
        count = all_works.count
        Work.sort_by_vote.count.must_equal count
      end

      it "returns the correct first work" do
        work_with_most_votes = Work.spotlight
        Work.sort_by_vote.first.must_equal work_with_most_votes
      end
    end
  end
end
