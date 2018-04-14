require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do
    vote = Vote.new(work_id: 1, user_id: 1)
    value(vote).must_be :valid?
  end

  it "must have a user_id" do

    vote = Vote.new(work_id: 3)

    value(vote).must_be :invalid?
  end

  it "must have a work_id" do

    vote = Vote.new(user_id: 1)
    value(vote).must_be :invalid?

  end

  it "must have a user_id for an existing user" do

    vote = Vote.new(work_id: 1, user_id: 497)
    value(vote).must_be :invalid?

  end

  it "must have a work_id for an existing work" do

    vote = Vote.new(work_id: 87, user_id: 5)
    value(vote).must_be :invalid?

  end

  it "must have a unique combination of user_id and work_id" do

    vote.work_id = 2
    vote.user_id = 14
    value(vote).must_be :invalid?

    vote.work_id = 2
    vote.user_id = 16
    value(vote).must_be :valid?

    vote.work_id = 17
    vote.user_id = 6
    value(vote).must_be :invalid?

    vote.work_id = 11
    vote.user_id = 6
    value(vote).must_be :valid?

  end

  describe "report_works_voted_for(id_for_user)" do

    # USER 14:  1, 2, 3, 23 (:two, :three, :six, :twentynine)
    # USER 8: 9, 23, 25 (:fourteen, :twentyeight, :thirtytwo)
    # USER 7: 10 (:sixteen)
    # USER 5: nothing

    before do

      @user_14_result = Vote.report_works_voted_for(14)
      @user_8_result = Vote.report_works_voted_for(8)
      @user_7_result = Vote.report_works_voted_for(7)
      @user_5_result = Vote.report_works_voted_for(5)

    end

    it "must return the exact number of works a user has voted for" do

      @user_14_result.count.must_equal 4
      @user_8_result.count.must_equal 3
      @user_7_result.count.must_equal 1


    end

    it "must return an empty relation when a user has not voted for any works" do

      @user_5_result.count.must_equal 0

    end

    it "must return the correct set of works for a given user" do

      # USER 14:  1, 2, 3, 23 (:two, :three, :six, :twentynine)
      # USER 8: 9, 23, 25 (:fourteen, :twentyeight, :thirtytwo)
      # USER 7: 10 (:sixteen)

      assert_includes @user_14_result, :two
      assert_includes @user_14_result, :three
      assert_includes @user_14_result, :six
      assert_includes @user_14_result, :twentynine

      assert_includes @user_8_result, :fourteen
      assert_includes @user_8_result, :twentyeight
      assert_includes @user_8_result, :thirtytwo

      assert_includes @user_7_result, :sixteen

    end

  end

end
