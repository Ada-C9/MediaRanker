require "test_helper"

describe Work do
  let(:work1) { works(:work1) }
  let(:work2) { works(:work2) }
  let(:all_works) { Work.all }

  describe "validations" do
    it "is valid when all fields are present" do
      result = work1.valid?
      result.must_equal true
    end

    it "is not valid when required fields are not present" do
      work2.title = nil
      work2.creator = nil
      work2.category = nil
      result = work2.valid?
      result.must_equal false
      work2.errors.messages.must_include :title
      work2.errors.messages.must_include :creator
      work2.errors.messages.must_include :category
    end

    # it "is not valid when work titles are not unique" do
    #   work2_title = work2.title
    #   creator = "me"
    #   dup_work = Work.create(title: work2_title, creator: creator)
    #   dup_work.valid?.must_equal false
    # end

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
  end
end
