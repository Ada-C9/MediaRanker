require "test_helper"

describe Work do
  # before do
  #   @post = Post.create!(name:'Awesome Post')
  # end
  before do
    # @movies = Work.all_movies
    @work = works(:four_hour_chef)
  end

  describe 'validations' do
    it 'has a title' do
      book_title = @work.title
      book_title.must_equal("The 4-Hour Chef")
    end

    it 'is invalid without a title' do
      no_title = Work.new(
      title: nil,
      created_by: "Tim Ferriss",
      publication_date: 12-23-2008,
      description: "description",
      category: "book",)

      no_title.valid? false
      @work.errors.messages.must_include :title
    end

  end

  # describe 'top media' do
    #   it 'returns top ten albums' do
    #   end
    #
    #   it 'returns top ten movies' do
    #   end
    #
    #   it 'can create a new work' do
    #   end
    # end
  # end

  #
  # describe 'relations' do
  #   it 'has a vote' do
  #   end
  #
  #   it 'can set a vote' do
  #   end
  # end
  #

end
