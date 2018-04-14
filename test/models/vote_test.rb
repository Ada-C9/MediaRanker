require "test_helper"

describe Vote do

  before do

    @user_bojack = users(:bojack)
    @user_diane = users(:diane)
    @user_todd = users(:todd)
    @user_jill = users(:jill)

    @work_fully = works(:fully)
    @work_green = works(:green)
    @work_breakfast = works(:breakfast)
    @work_carsick = works(:carsick)

    @vote_1 = Vote.new user_id: @user_jill.id, work_id: @work_carsick.id
    @vote_2 = Vote.new user_id: @user_todd.id, work_id: @work_breakfast.id
    @vote_3 = Vote.new user_id: @user_bojack.id, work_id: @work_breakfast.id





    # USER 14:  1, 2, 3, 23 (:two, :three, :six, :twentynine)
    # USER 8: 9, 23, 25 (:fourteen, :twentyeight, :thirtytwo)
    # USER 7: 10 (:sixteen)

  end

  let(:vote) { Vote.new user_id: @user_diane.id, work_id: @work_breakfast.id }

  it "must be valid" do
    vote = Vote.new user_id: @user_bojack.id, work_id: @work_fully.id
    value(vote).must_be :valid?
  end

  it "must have a work_id" do

    vote = Vote.new user_id: @user_bojack.id
    value(vote).must_be :invalid?

  end

  it "must have a user_id" do

    vote = Vote.new work_id: @work_fully.id
    value(vote).must_be :invalid?

  end

  it "must have a user_id for an existing user" do

    vote = Vote.new work_id: @work_fully.id, user_id: 27
    value(vote).must_be :invalid?

  end

  it "must have a work_id for an existing work" do

    vote = Vote.new work_id: 87, user_id: @user_bojack.id
    value(vote).must_be :invalid?

  end

  it "must have a unique combination of user_id and work_id" do


    dup_vote = Vote.new work_id: @work_carsick.id, user_id: @user_jill.id
    vote.work_id = @work_carsick.id
    vote.user_id = @user_jill.id


    value(vote).must_be :invalid?

    # vote.work_id = @work_carsick.id
    # vote.user_id = @user_bojack.id
    # value(vote).must_be :valid?
    #
    # vote.work_id = @work_breakfast.id
    # vote.user_id = @user_todd.id
    # value(vote).must_be :invalid?
    #
    # vote.work_id = @work_carsick.id
    # vote.user_id = @user_todd.id
    # value(vote).must_be :valid?

  end

  describe "report_works_voted_for(id_for_user)" do

    before do

      @user_14_result = Vote.report_works_voted_for(14)
      @user_8_result = Vote.report_works_voted_for(8)
      @user_7_result = Vote.report_works_voted_for(7)
      @user_5_result = Vote.report_works_voted_for(5)

      @vote_two = votes(:two)
      @vote_three = votes(:three)
      @vote_six = votes(:six)
      @vote_fourteen = votes(:fourteen)
      @vote_sixteen = votes(:sixteen)
      @vote_twentyeight = votes(:twentyeight)
      @vote_twentynine = votes(:twentynine)
      @vote_thirtytwo = votes(:thirtytwo)

    end

    it "must return the exact number of works a user has voted for" do

      @user_14_result.find_by()
      @user_8_result.count.must_equal 3
      @user_7_result.count.must_equal 1


    end

    it "must return an empty relation when a user has not voted for any works" do

      @user_5_result.count.must_equal 0

    end

    it "must return the correct set of works for a given user" do

      assert_includes @user_14_result, @vote_two
      assert_includes @user_14_result, @vote_three
      assert_includes @user_14_result, @vote_six
      assert_includes @user_14_result, @vote_twentynine
      #
      assert_includes @user_8_result, @vote_eight
      assert_includes @user_8_result, @vote_twentyeight
      assert_includes @user_8_result, @vote_thirtytwo
      #
      assert_includes @user_7_result, @vote_sixteen

    end

  end
end
