require "test_helper"

describe User do
  let(:user) { User.new(user_name: "Nicoleta")}

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "requires a unique username" do
    user1 = User.new(user_name: "Nicoleta")
    user1.save

    user2 = User.new(user_name: "Nicoleta")
    user2.save.must_equal false
    user2.errors.messages.must_include :user_name
  end

  describe "total_votes" do
    it "counts the number of votes" do
      work = Work.create!(title: "selma", category: "movie")
      3.times do |i|
        user = User.create!(user_name: "user#{i}")
        Vote.create!(user: user, work: work)
      end
      work.total_votes.must_equal 3
      Work.find(work.id).total_votes.must_equal 3
    end
  end

end
