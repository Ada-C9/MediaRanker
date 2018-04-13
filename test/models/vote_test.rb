require "test_helper"
require 'pry'

describe Vote do
  before do
    @user = users(:dan)
    @work = works(:metz)
    @vote = Vote.create(user_id: @user.id, work_id: @work.id)
    binding.pry
  end

  it "exists" do
    result = @vote.valid?

    @vote.must_be_kind_of Vote
    result.must_equal true
  end

  describe "relations" do
    before do
      @user = users(:dan)
      @work = works(:metz)

    end

    it "has adds a counter_cache to work" do
      result = @vote.work.vote_count

      result.must_equal 1
    end

  end
  #
  # describe "validations" do
  #   it "disallows a blank name" do
  #     result = User.new(name: "").valid?
  #
  #     result.must_equal false
  #   end
  #
  # end
end
