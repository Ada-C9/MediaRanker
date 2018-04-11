require "test_helper"

describe Work do
  describe 'validations' do
    before do
      #Arrange
      @work = Work.new(category: 'movie',title: 'Life')
    end

    it "can be created with required fields" do
      #Act
      result = @work.valid?

      #Assert
      result.must_equal true
    end

    it "is invalid without a title" do
      @work.title = nil

      result = @work.valid?
      result.must_equal false
      @work.errors.messages.must_include :title
    end

    it "is invalid with a nonunique title" do
      duplicate = Work.first

      @work.title = duplicate
      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end
  end


  describe 'relations' do

  end
end
