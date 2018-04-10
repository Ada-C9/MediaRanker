require "test_helper"

describe Art do
  describe 'validations' do
    before do
      #Arrange
      @art = Art.new(category: 'Movie', title: 'Flashdance')
    end

    it 'is valid when it has a category and title' do
      #Act
      result = @art.valid?

      #Assert
      result.must_equal true
    end

    it 'is invalid when it has no title' do
      #Arrange
      @art.title = nil
      #Act
      result = @art.valid?
      #Assert
      result.must_equal false
    end

    it 'is invalid when it has no category' do
      @art.category = nil
      result = @art.valid?
      result.must_equal false
    end
  end
end
