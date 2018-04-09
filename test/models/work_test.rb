require "test_helper"

describe Work do
  describe 'relations' do
    it 'connects works and users' do
      user = User.first
      work = Work.create(title: 'No Scrubs')

      work.users << user
      work.user_ids.must_include user.id
    end

  end

  describe 'validations' do
    before do
      @work = Work.new(title: 'A new work')
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
end
