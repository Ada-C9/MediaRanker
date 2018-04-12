require "test_helper"

describe Work do
  # metz = Author.where(name: "Sandi Metz") or
  # metz = authors(:metz) # like in the yaml
  before do
    @movies = Work.all_movies
  end

  # before do
  #   @post = Post.create!(name:'Awesome Post')
  # end

  describe 'top media' do
    it 'returns top ten movies' do
      # arrange & act
      top_movies = @movies.top_movies

      top_movies.count.must_equal(10)
    end
  end

  #   it 'returns top ten albums' do
  #   end
  #
  #   it 'returns top ten books' do
  #   end
  #
  #   it 'can create a new work' do
  #   end
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
  # describe 'validations' do
  #   it 'has a title' do
  #   end
  #
  #   it 'has an author' do
  #   end
  #
  #   it 'has a publication date or year' do
  #   end
  #
  #   # does not have to have a description
  # end

end
