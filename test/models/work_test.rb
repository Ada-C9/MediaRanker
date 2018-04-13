require "test_helper"

describe Work do
  describe 'relations' do
    let(:work) { Work.first }

    it 'connects user_ids and users' do
      user = User.first
      work = Work.create(title: 'No Scrubs')

      work.users << user
      work.user_ids.must_include user.id
    end

    it 'belongs to a category' do
      category = Category.first

      work.category = category
      work.category_id.must_equal category.id
    end

    it 'connects vote and vote_id' do
      vote = Vote.create!(user_id: User.first.id, work_id: work.id)

      work.vote_ids.must_include vote.id
    end

  end

  describe 'validations' do
    before do
      @work = Work.new(title: 'A new work')
      @work.category = Category.first
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
  end

  describe 'model methods' do
    before do
      @work1 = works(:backtoblack)
      @work2 = works(:hill)
      @work3 = works(:noscrubs)

      @user1 = users(:taco)
      @user2 = users(:roo)

      @category = Category.find_by(name: 'album')

      Vote.create!(user_id: @user1.id, work_id: @work1.id)
      Vote.create!(user_id: @user1.id, work_id: @work3.id)
      Vote.create!(user_id: @user2.id, work_id: @work3.id)
    end

    it 'can order a category of works by vote' do

      vote_ordered_works = [@work3, @work1, @work2]

      result = Work.order_by_vote(@category.id)
      result.must_equal vote_ordered_works
    end

    it 'can get the top work of all media by votes' do
      top_work = @work3
      result = Work.top_work

      result.must_equal top_work
    end
  end
end
