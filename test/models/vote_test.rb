require "test_helper"

describe Vote do
  let(:vote) { votes(:one) }

  it "must be valid" do
    vote.must_be :valid?
  end

  it "must have a unique user/work per category" do
    vote_one = votes(:one)
    vote_two = votes(:seven)
    vote_two.work = works(:book_one)
    vote_two.valid?.must_equal false
  end

  it "is invalid without both work and user ids" do
    votes(:four).work_id = nil
    votes(:four).user_id = nil

    votes(:four).valid?.must_equal false
    votes(:four).errors.messages.must_include :work
    votes(:four).errors.messages.must_include :user
  end


  describe 'relations' do

    it 'must belong to a work' do

      votes(:one).work.must_equal works(:book_one)
    end

    it 'must belong to a user' do
      votes(:two).user.must_equal users(:angela)
    end

  end

end
