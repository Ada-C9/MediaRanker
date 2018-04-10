require "test_helper"

describe Art do
  describe 'validations' do
    before do
      #Arrange
      @art = Art.new(cateogry: 'Movie', name: 'Flashdance')
    end

    it 'is valid when it has a category and name' do
      #Act
      result = @art.valid?

      #Assert
      result.must_equal true
    end
  end
end
