# require "test_helper"
#
# describe Art do
#   describe 'validations' do
#     before do
#       #Arrange
#       @art = Art.new(category: 'movie', title: 'Flashdance')
#     end
#
#     it 'is valid when it has a category and title' do
#       #Act
#       result = @art.valid?
#
#       #Assert
#       result.must_equal true
#     end
#
#     it 'is invalid when it has no title' do
#       #Arrange
#       @art.title = nil
#       #Act
#       result = @art.valid?
#       #Assert
#       result.must_equal false
#     end
#
#     it 'is invalid when it has no category' do
#       @art.category = nil
#       result = @art.valid?
#       result.must_equal false
#     end
#
#     it 'is valid with a valid category type' do
#       @art.category = "movie"
#       @art.valid?.must_equal true
#
#       @art.category = "album"
#       @art.valid?.must_equal true
#
#       @art.category = "book"
#       @art.valid?.must_equal true
#     end
#
#     it 'is invalid with a non valid category type' do
#       @art.category = 'game'
#       @art.valid?.must_equal false
#     end
#   end
# end

# TODO: PUT IN FIXTURES INSTEAD OF BEFORE USE
