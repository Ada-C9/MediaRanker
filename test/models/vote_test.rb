require "test_helper"

describe Vote do
  describe 'validations' do
    before do
      # Arrange
      @vote = Vote.new(user_id: users(:c_dagger).id, art_id: arts(:one).id)
      # Using fixtures
    end

    it 'is valid with an associated user_id and art_id' do
      # Act
      result = @vote.valid?
      # Assert
      result.must_equal true
    end

    it 'is invalid without an user_id' do
      @vote.user_id = nil

      result = @vote.valid?

      result.must_equal false
    end

    it 'is invalid without an art_id' do
      @vote.art_id = nil
      result = @vote.valid?
      result.must_equal false
    end

  end

  describe 'relationships' do
    before do
      @vote = Vote.new(user_id: users(:c_dagger).id, art_id: arts(:one).id)
    end

    it 'responds to user' do
      @vote.must_respond_to :user
    end

    it 'responds to art' do
      @vote.must_respond_to :art
    end

    it 'connects the user_id to the correct instance of User class' do
      # Arrange
      user = users(:c_dagger)

      # Act
      @vote.user = user

      # Assert
      @vote.user_id.must_equal user.id
    end

    it 'connects the art_id to the correct instance of Art class' do
      # Arrange
      art = arts(:one)

      # Act
      @vote.art = art

      # Assert
      @vote.art_id.must_equal art.id
    end
  end
end
