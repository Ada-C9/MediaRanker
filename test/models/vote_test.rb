require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do\
    value(vote).must_be :valid?
  end

  it "does not allow voting twice" do
    user = nil
    work = nil

    vote = Vote.create!(user: user, work: work)
    vote2 = Vote.new(user: user, work: work)

    expect(vote2.valid?).to eq(false)

    expect(vote2.errors[:user])
      .to include("You cannot vote for same work twice.")
  end

  it 'can assign a user to a vote' do
    user = User.create!(username: "Nora")
    vote = Vote.new(user: user)

    vote.user_id.must_equal user.id

  end
end
