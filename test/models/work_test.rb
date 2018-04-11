require "test_helper"

describe Work do
  describe "validations" do
    # all validations pass
    before do
      @creator = "Da Vinci"
      @publication_year = 1337
      @work = Work.new(title: "test work", creator: @creator, publication_year: @publication_year)
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
      Work.create!(title: title, creator: @creator, publication_year: @publication_year)
      @work.title = title

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end
  end

end
