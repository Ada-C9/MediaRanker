require "test_helper"

describe Work do

  describe "validations" do

    it "must have a title" do
      new_work = Work.new

      result = new_work.valid?

      result.must_equal false
    end

  end # validationts

  describe "relationships" do

    it "connects vote and vote id" do

      vote_for_poodr = votes(:vote_for_poodr)

      poodr = works(:poodr)

      poodr.votes.must_include vote_for_poodr

    end

  end # relationships

end
