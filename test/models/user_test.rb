require "test_helper"

describe User do
  describe 'validations' do
    before do
      # Arrange
      user = User.new(username: 'test')
      @vote = Vote.new(user_id: 1, work_id: 1)
      @work = Work.new(title: 'test_song', category: 'album')
    end

  it "must have username" do
  end

  describe User do
    describe 'relations' do
      it "can have a vote" do
        user = users(:potterhead)
        user.vote_id.must_equal votes(:vote_2)
      end
    end
  end
end
