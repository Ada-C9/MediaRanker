require "test_helper"
require 'pry'
describe Vote do
  before do

      # let(:book) { Book.new title: "Wizard of Oz", author_id: (Author.create name: "Kari B").id }

    @work = Work.create category: "album", title: "beyonce", creator: "MyString", publication_year: 2017-04-19, description: "self-titled album"

    @user = User.create username: 'test'

    @vote = Vote.new(user_id: @user.id, work_id: @work.id)
  end

  it "is valid when all fields are present" do
    result = @vote.valid?
    result.must_equal true
  end

  it 'is invalid if user not exist' do
    @vote.user_id = nil
    result = @vote.valid?
    result.must_equal false
    @vote.errors.messages.must_include :user
  end

  it 'is invalid if work does not exist' do
    @vote.work_id = nil
    result = @vote.valid?
    result.must_equal false
    @vote.errors.messages.must_include :work
  end

  describe 'relations' do
    it "belongs to a work" do
      vote = votes(:vote_1)
      vote.work_id.must_equal works(:beyonce).id
    end

    it "belongs to a user" do
      vote = votes(:vote_2)
      vote.user_id.must_equal users(:potterhead).id
    end
  end
end
