require "test_helper"

describe Vote do
  describe "validations" do
    user = User.create!(name: "bob")
    work = Work.create!(category: "album", title: "purple rain", creator: "prince", publication_year: 1984, description: "one of the best albums of the year")

    it "can be created with all fields" do

      v = Vote.new(user: user, work: work)
      result = v.valid?
      result.must_equal true
    end

    it "requires a work id" do
      u = User.new(name: "cheetara")
      v = Vote.new(user_id: u)
      result = v.valid?
      result.must_equal false

      v.errors.messages.must_include :work_id
    end

    it "requires a user id" do
      w = Work.new(category: "album", title: "purple rain", creator: "prince", publication_year: 1984, description: "one of the best albums of the year")
      v = Vote.new(work_id: w)
      result = v.valid?
      result.must_equal false

      v.errors.messages.must_include :user_id
    end

  end

  describe "relationships" do
    it "has a user" do
      v = Vote.new(user_id: user.id, work_id: work.id)
      u = User.new(name: "cheetara")

      v.must_respond_to :user
      v.user.must_equal u
      v.user_id.must_equal u.id
    end

    it "has a work" do
      v = Vote.new

      v.must_respond_to :work
      v.work.must_equal work
      v.work_id.must_equal work.id
    end
  end

end
