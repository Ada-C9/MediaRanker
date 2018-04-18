require "test_helper"

describe Vote do
  describe 'relations' do
    let(:vote) { Vote.new }

    it 'connects work and work_id' do
      work = Work.first

      vote.work = work
      vote.work_id.must_equal work.id
    end

    it 'connects user and user_id' do
      user = User.first

      vote.user = user
      vote.user_id.must_equal user.id
    end
  end

  describe 'validations' do
    before do
      @user = User.first
      @work = Work.first
      @vote1 = Vote.create!(user_id: @user.id, work_id: @work.id)
    end

    it 'does not let a user vote for the same work twice' do
      vote2 = Vote.new(user_id: @user.id, work_id: @work.id)
      result = vote2.valid?

      result.must_equal false
    end

    it 'lets a user vote for two different works' do
      work2 = works(:backtoblack)
      vote2 = Vote.new(user_id: @user.id, work_id: work2.id)

      result = vote2.valid?
      result.must_equal true
    end
  end
end
