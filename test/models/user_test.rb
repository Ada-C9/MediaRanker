require "test_helper"

describe User do
  before do
  end

  describe 'relations' do
    let(:user) { User.first }

    it 'relates works and users' do
      work = Work.first

      user.works << work
      user.work_ids.must_include work.id
    end

    it 'relates vote and vote_id' do
      vote = Vote.create!(user_id: user.id, work_id: Work.first.id)

      user.vote_ids.must_include vote.id
    end
  end

  describe 'validations' do
    before do
      @user = User.new(username: 'Username')
    end

    it 'cannot be created without a username' do
      @user.username = nil
      result = @user.valid?

      result.must_equal false
    end

    it 'cannot be created if the username has been taken' do
      @user.save
      username = @user.username
      user2 = User.new(username: username)

      result = user2.valid?

      result.must_equal false
    end

    it 'can be created with all required fields' do
      result = @user.valid?
      result.must_equal true
    end
  end

  describe 'recommender' do
    before do
      @tor = users(:tor)
      @roo = users(:roo)
      @hill = works(:hill)
      @noscrubs = works(:noscrubs)

      Vote.create!(user_id: @tor.id, work_id: @noscrubs.id)
      Vote.create!(user_id: @roo.id, work_id: @noscrubs.id)
      Vote.create!(user_id: @roo.id, work_id: @hill.id)

    end

    it 'must calculate a jaccard index between a two users' do
      result = User.calculate_jaccard(@tor, @roo)

      result.must_equal 0.5
    end

    it 'recommends works that other users have upvoted' do
      top_similar = [@roo]
      test_result = User.get_recommendations(top_similar, @tor)

      expected_result = [works(:hill)]
      test_result.must_equal expected_result
    end

    it 'recommends works from users who have liked similar things' do
      recommended_works = [@hill]

      test_result = User.recommendations(@tor)

      test_result.must_equal recommended_works
    end
  end

  describe 'larger sample size recommender tests' do
    it 'recommends works from users who have liked similar things' do
      user = User.find(3)

      test_result = User.recommendations(user)
      work = test_result[0]

      test_result.must_be_kind_of Array
      test_result.wont_be_empty
      user.works.wont_include work
    end
  end
end
