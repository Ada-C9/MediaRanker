require "test_helper"
require 'pry'

describe Work do

  describe 'Validations' do
    # nominal
    it "is valid when all fields are present" do
      works(:work_0).valid?.must_equal true
    end

    # presence
    it "is invalid without a title" do
      works(:work_0).title = nil

      works(:work_0).valid?.must_equal false
      works(:work_0).errors.messages.must_include :title
    end

    it "is invalid if title is a string with only spaces" do
      works(:work_0).title = "     "

      works(:work_0).valid?.must_equal false
      works(:work_0).errors.messages.must_include :title
    end

    # uniqueness
    it "is invalid if a work with same title and category already exists" do
      work = Work.new(title: works(:work_0).title, category: works(:work_0).category)

      work.valid?.must_equal false
      work.errors.messages.must_include :title
    end

    # length
    it "is invalid if length of title is smaller than 1" do
      works(:work_0).title = ""

      works(:work_0).valid?.must_equal false
      works(:work_0).errors.messages.must_include :title
    end
  end

  describe 'Relations' do
    it "can access votes through 'votes'" do
      works(:work_1).votes.count.must_equal 11
    end

    it "can destroy votes when destroy work" do
      votes = works(:work_1).votes

      votes.count.must_equal 11

      works(:work_1).destroy

      votes.count.must_equal 0
    end
  end

  describe 'Methods' do

    describe 'total_votes' do
      it "returns the right vote count" do
        works(:work_1).total_votes.must_equal 11
      end

      it "returns 0 if no vote exists" do
        works(:work_0).total_votes.must_equal 0
      end
    end

    describe 'sorted_list' do
      it "returns a sorted list of the all works given a category" do
        Work.sorted_list("album").count.must_equal 12
        Work.sorted_list("album").first.must_equal works(:work_1)
        Work.sorted_list("album").last.must_equal works(:work_0)
      end

      it "returns an empty list if work count is 0 in that category" do
        Work.sorted_list("movie").count.must_equal 0
        Work.sorted_list("movie").first.must_equal nil
        Work.sorted_list("movie").last.must_equal nil
      end
    end

    describe 'top_10' do
      it "returns the top 10 works by vote given a category" do
        Work.top_10("album").count.must_equal 10
        Work.top_10("album").first.must_equal works(:work_1)
        Work.top_10("album").last.must_equal works(:work_10)
      end

      it "returns all top works by vote given a category if work count is smaller than 10" do
        Work.top_10("book").count.must_equal 5
        Work.top_10("book").first.must_equal works(:work_16)
        Work.top_10("book").last.must_equal works(:work_12)
      end

      it "returns an empty list of works if work count is 0" do
        Work.top_10("movie").count.must_equal 0
        Work.top_10("movie").first.must_equal nil
        Work.top_10("movie").last.must_equal nil
      end
    end

    describe 'top_1' do
      it "returns the top 1 work by vote" do
        Work.top_1.must_equal works(:work_1)
      end
    end

  end

end
