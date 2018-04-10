require "test_helper"

describe Publication do
  let(:publication) { Publication.new }

  describe 'publication validity'
    it 'must be valid' do
    end
    it 'requires a title and category' do
    end
    it 'wont a take an empty string for a title' do
    end
    it 'wont make a duplicate record' do
    end
  end

  describe 'publication relationships'
    it 'can have zero or more votes' do
    end
  end

  describe 'custom methods' do
    describe 'self.find_spotlight_publication' do
    end
    describe 'self.return_all_categories' do
    end
    describe 'self.find_top_ten_by' do
    end
    describe 'find_total_votes' do
    end
  end
end
