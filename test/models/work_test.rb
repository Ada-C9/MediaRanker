require "test_helper"

describe Work do

  describe 'Validations' do
    # nominal
    it "is valid when all fields are present" do
      works(:aja).valid?.must_equal true
    end

    # presence
    it "is invalid without a title" do
      works(:aja).title = nil

      works(:aja).valid?.must_equal false
      works(:aja).errors.messages.must_include :title
    end

    it "is invalid if title is a string with only spaces" do
      works(:aja).title = "     "

      works(:aja).valid?.must_equal false
      works(:aja).errors.messages.must_include :title
    end

    # uniqueness
    it "is invalid if a work with same title and category already exists" do
      work = Work.new(title: works(:aja).title, category: works(:aja).category)

      work.valid?.must_equal false
      work.errors.messages.must_include :title
    end

    # length
    it "is invalid if length of title is smaller than 1" do
      works(:aja).title = ""

      works(:aja).valid?.must_equal false
      works(:aja).errors.messages.must_include :title
    end
  end

  describe 'Relations' do
    it "can access votes through 'votes'" do
      works(:aja).votes.count.must_equal 1
    end

    it "can destroy votes when destroy work" do
      votes = works(:aja).votes

      votes.wont_equal []

      works(:aja).destroy

      votes.must_equal []
    end
  end

  describe 'Methods' do

    describe 'total_votes' do
      it "returns the right vote count" do
        works(:parable).total_votes.must_equal 2
      end

      it "returns 0 if no vote exists" do
        works(:coco).total_votes.must_equal 0
      end
    end

    describe 'sorted_list' do

    end

    describe 'top_10' do

    end

    describe 'top_1' do

    end

  end

end
