require "test_helper"

describe Vote do
  let(:vote) { votes(:one)}

  it "has a user" do
  votes(:one).must_respond_to :user
  end

  it "has a work" do
  votes(:one).must_respond_to :work
  end

describe "validations" do

  it "doesn't allow the same user to vote twice on a work" do
    user1 = User.new(user_name: "Nicoleta")
    work1 = Work.new(category: "movie", title: "selma")

    vote1 = Vote.new(user: user1, work: work1)
    vote1.save
    vote2 = Vote.new(user: user1, work: work1)
    vote2.valid?.must_equal false

    vote2.errors.messages.must_include :user
end

  end
end
