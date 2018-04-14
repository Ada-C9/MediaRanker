require "test_helper"

describe Vote do
  describe "validations" do
    # all validations pass
    before do
      @user = users(:angela)
      @work = works(:lemonade)
      @vote = Vote.create(user_id: @user.id, work_id: @work.id)
    end

    it "can be created" do
      # Act
      result = @vote.valid?

      # Assert
      result.must_equal true
    end

    # duplicate title -> fail
    it "WRITE THIS: is invalid when user votes on same work" do
      before = @vote.valid?
      before.must_equal true
      new_vote = Vote.create(user_id: @user.id, work_id: @work.id)
      result = new_vote.valid?
      result.must_equal false
      user.errors.messages.must_include :vote
    end
  end

  describe 'relations' do
    before do
      @work = works(:lemonade)
      @user = users(:angela)
    end

    it "connects user and user_id" do
      # Arrange
      vote = Vote.create!(user_id: @user.id, work_id: @work.id)

      # Assert
      vote.user.must_equal @user
    end

    it "connects work and work_id" do
      # Arrange
      vote = Vote.create!(user_id: @user.id, work_id: @work.id)

      vote.work.must_equal @work
      # Assert
    end
  end

  describe 'business logic' do
    before do
    end

  end
end
