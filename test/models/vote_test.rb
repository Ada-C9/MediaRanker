require "test_helper"

describe Vote do
  let(:vote) {votes(:one)}

  it "will be valid it has a user and work" do
    vote.valid?.must_equal true
  end

  it "will not be valid without a user" do
    vote.user = nil
    vote.valid?.must_equal false
    vote.errors.must_include :user
  end

  it "will not be valid without a work" do
    vote.work = nil
    vote.valid?.must_equal false
    vote.errors.must_include :work
  end

end
