require "test_helper"

describe Work do
  let(:work1) { works(:work1) }
  let(:work2) { works(:work2) }
  let(:dup_work) { works(:dup_work) }

  describe "validations" do
    it "is valid when all fields are present" do
      result = work1.valid?
      result.must_equal true
    end

    it "is not valid when required fields are no present" do
      work2.title = nil
      work2.creator = nil
      result = work2.valid?
      result.must_equal false
      work2.errors.messages.must_include :title
      work2.errors.messages.must_include :creator
    end

    it "is not valid when work titles are not unique" do
      work2_title = work2.title
      creator = "me"
      dup_work = Work.create(title: work2_title, creator: creator)
      dup_work.valid?.must_equal false
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
end
