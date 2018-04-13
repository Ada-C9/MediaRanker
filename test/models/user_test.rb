require "test_helper"

describe User do

  it "exists" do
    user = User.first
    result = user.valid?

    user.must_be_kind_of User
    result.must_equal true
  end

  describe "relations" do
    before do
      @user = users(:dan)
      @work = works(:metz)
      @vote = Vote.create(user_id: @user.id, work_id: @work.id)
    end

    it "matches user to work" do
      result = @user.voted_works

      result.must_include works(:metz)
    end

  end

  describe "validations" do
    it "disallows a blank name" do
      result = User.new(name: "").valid?

      result.must_equal false
    end

  end

  # describe "methods" do
  # end

end
