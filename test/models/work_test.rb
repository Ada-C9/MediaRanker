require "test_helper"

describe Work do
  describe 'validations' do
    before do
      #Arrange
      @work = Work.new(title: Work.first, category: Work.first)
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
      duplicate = Work.last

      @work.title = duplicate.title
      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

    it "is invalid without a category" do
      @work.category = nil

      result = @work.valid?
      result.must_equal false

      @work.errors.messages.must_include :category
    end
  end



  # QUESTION: describe 'relations' do
    before do
      @work = Work.new(title: Work.last, category: Work.last)
    end
    #has_many relationship
    it 'connects votes with vote_ids' do
      # Arrange
      # Act
      # Assert

    # end
  end
end
