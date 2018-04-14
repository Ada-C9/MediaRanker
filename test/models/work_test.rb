require "test_helper"

describe Work do

  describe 'validations' do
    before do
      @work = Work.new(category: 'movie', title: 'test title', creator: 'test creator', publication_year: 2018, description: 'test description' )
    end

    it 'is valid when all fields are present' do
      result = @work.valid?
      result.must_equal true
    end

    it 'is invalid without a category' do
      @work.category = nil
      result = @work.valid?
      result.must_equal false
      @work.errors.messages.must_include :category
    end

    it 'is invalid without a title' do
      @work.title = nil
      result = @work.valid?
      result.must_equal false
      @work.errors.messages.must_include :title
    end
  end

  describe 'relations' do

    it 'has many votes' do
      work = works(:black_panther)
      work.votes.length.must_equal 2
      work.votes.must_include votes(:movie_vote)
      work.votes.must_include votes(:another_movie_vote)
    end

    it 'has many users through votes' do
      work = works(:black_panther)
      work.users.length.must_equal 2
      work.users.must_include users(:luke)
      work.users.must_include users(:samuel)
    end

  end

end
