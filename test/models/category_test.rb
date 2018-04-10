require "test_helper"

describe Category do
  describe 'relations' do
    it 'relates to works' do
      work = Work.first
      category = Category.new(name: 'album')

      category.works << work
      category.work_ids.must_include work.id

    end
  end

  describe 'validations' do
    before do
      @category = Category.new(name: 'album')
    end
    it 'can be created with all required fields' do
      result = @category.valid?

      result.must_equal true
    end

    it 'cannot be created without a name' do
      @category.name = nil
      result = @category.valid?

      result.must_equal false
    end
  end
end
