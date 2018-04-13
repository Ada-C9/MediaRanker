require "test_helper"
require 'pry'
describe Work do
  describe 'validations' do
    before do
      @work = Work.create(category: "album", title: "beyonce", creator: "MyString", publication_year: "2017", description: "self-titled album")
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

    it 'is invalid without a category' do
      @work.category = nil
      result = @work.valid?
      result.must_equal false
      @work.errors.messages.must_include :category
    end

    it 'is valid without a description publication_year' do
      @work.description = nil
      result = @work.valid?
      result.must_equal true
    end

    it 'is valid without a publication_year' do
      @work.publication_year = nil
      result = @work.valid?
      result.must_equal true
    end

  end

  describe 'relations' do
    it "can have a vote" do
      work = works(:beyonce)
      # I used include not equal because beyonce work has 2 votes
      work.votes.must_include votes(:vote_1)
    end
  end
end
