require "test_helper"

describe Work do
  describe 'validations' do
    before do
      @work = Work.new(category: album, title: beyonce, creator: MyString, publication_year: 2018-04-09, description: self-titled album)
    end
    it "is valid when all fields are present" do
      result = @work.valid?
      result.must_equal true
  end

it 'is invalid without a title' do
  @work.title = nil
  result = @work.valid?
  result.must_equal false
  @work.errors.messages.must_include :title
end

it 'is invalid without a creator' do
  @work.creator = nil
  result = @work.valid?
  result.must_equal false
  @work.errors.messages.must_include :creator
end

it 'is invalid without a publication_year' do
  @work.publication_year = nil
  result = @work.valid?
  result.must_equal false
  @work.errors.messages.must_include :publication_year
end
it 'is invalid without a description' do
  @work.description = nil
  result = @work.valid?
  result.must_equal false
  @work.errors.messages.must_include :description
end

it 'is invalid without a category' do
  @work.category = nil
  result = @work.valid?
  result.must_equal false
  @work.errors.messages.must_include :category
end

  describe Work do
    describe 'relations' do
      it "can have a vote" do
        work = works(:beyonce)
        work.vote_id.must_equal votes(:vote_1)
      end
    end
  end
end
