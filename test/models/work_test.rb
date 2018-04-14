require "test_helper"

describe Work do
  let(:work) { Work.new title: "Les Pas Perdus", category: "book" }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must have a category" do
    work.category = nil
    value(work).must_be :invalid?
  end

  it "must have a title" do
    work.title = ""
    value(work).must_be :invalid?
    work.title = "Mission Child"
    value(work).must_be :valid?
  end

  it "must have a unique title" do
    work.title = "Rebirth"
    value(work).must_be :invalid?
  end

  it "must have a title between 1 and 25 letters" do
    work.category = "album"

    work.title = ""
    work.valid?.must_equal false

    work.title = "1234567890123456789012345678901234567890"
    work.valid?.must_equal false
  end

  describe "works_with_vote_tallies" do

    before do

      @works_n_tallies = Work.works_with_vote_tallies

    end

    it "returns an array" do


      @works_n_tallies.must_be_kind_of Array

    end

    it "is identical in length to the number of works in the database" do


      @works_n_tallies.length.must_equal 25

    end

    it "Is a structure in which each element is an array with a length of two " do

      bad_audit = []
      @works_n_tallies.each do |element|
        if element.length != 2
          bad_audit << element
        end
      end
      bad_audit.length.must_equal 0
    end

    it "contains elements that consist of an instance of Work at index 0 and a number at index 1 " do

      @works_n_tallies.each do |element|
        element[0].must_be_instance_of Work
        element[1].must_be_kind_of Integer
      end

    end


    it "contains elements in which index position 1 is the correct tally of votes for the element at index position 0" do

    end

  end

  describe "works_ordered_by_popularity" do

    it "returns an array" do
    end

    it "has a length identical to the number of works in the database" do

    end

    it "has the work with the most votes at array postion 0" do
    end

    it "has the work with the eightj most votes at array position 7" do

    end

    it "has the work with the lowest number of votes in the last array position" do

    end

  end

  describe "get_top_ten_works_with_tallies" do

    it "returns an array" do
    end

    it "has a length of 10" do
    end

    it "Is a structure in which each element is an array with a length of two " do
    end

    it "contains elements that consist of an instance of Work at index 0 and a number at index 1 " do
    end

    it "contains elements in which index position 1 is the correct tally of votes for the element at index position 0" do

    end

  end

  describe "get_top_work_with_tally" do

    it "returns an array" do
    end

    it "has a length of two" do
    end

    it "has the work-instance with the most votes at index 0" do

    end

    it "has the total number of votes for the work at array position 0 at index 1" do

    end

  end
end
