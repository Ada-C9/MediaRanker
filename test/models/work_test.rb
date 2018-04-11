require "test_helper"

describe Work do
  describe 'validations' do
     before do
       @work = Work.new(title: 'test movie', category: movie)
     end

     it 'can be created with all required fields' do
       result = @work.valid?

       result.must_equal true
     end

     it 'is invalid without a title' do
       @work.title = nil
       result = @work.valid?
       result.must_equal false
       @work.errors.messages.must_include :title
     end

     it '2nd movie with same title is invalid' do
      second_movie = Work.first
      @work.title = second_movie.title

      result = @work.valid?

      result.must_equal false
      @work.errors.messages.must_include :title
    end

   end
end
