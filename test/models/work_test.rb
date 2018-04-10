require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "must be valid" do
    value(work).must_be :valid?
  end


  describe Work do
    describe 'relations' do
      it "can have a vote" do
        work = works(:beyonce)
        work.vote_id.must_equal votes(:vote_1)
      end
    end
  end
end
