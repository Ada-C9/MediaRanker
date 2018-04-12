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
  # TODO: WRITE TESTS FOR RELATIONSHIPS FOR VOTES

  # describe 'relationships' do
  #   before do
  #
  #   end
  #
  #   it 'responds to user' do
  #
  #   end
  #
  #   it 'connects the user_id to the correct instance of User class' do
  #
  #   end
  #
  #   it 'responds to art' do
  #
  #   end
  #
  #   it 'connects the art_id to the correct instance of Art class'
  # end
end
