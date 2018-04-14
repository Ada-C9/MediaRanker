require "test_helper"

describe Work do
  describe "validations" do
    # all validations pass
    before do
      @work = works(:lemonade)
    end

    it "can be created will all required fields" do
      # Act
      result = @work.valid?

      # Assert
      result.must_equal true
    end

    it "is invalid without a title" do
      @work.title = nil

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

    # duplicate title -> fail
    it "is invalid with a duplicate title" do
      title = "duplicate"
      Work.create!(title: title, creator: "Dr. Seuss", publication_year: 1993)
      @work.title = title

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end
  end

  describe 'relations' do
    before do
      @work = works(:lemonade)
      @user = users(:angela)
    end

    it "connects vote and vote_id" do
      # Arrange
      vote = Vote.create!(user_id: @user.id, work_id: @work.id)

      # Assert
      @work.votes.must_include vote
    end
  end

  describe 'business logic' do
    before do
    end

  end


end
