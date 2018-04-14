require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do
    skip
    value(vote).must_be :valid?
  end

  describe 'relations' do

    it 'must belong to a work' do
      skip
      votes(:one).work.must_equal works(:book_one)
    end

    it 'must belong to a user' do
      skip
      votes(:two).user.must_equal users(:angela)
    end

  end

end
