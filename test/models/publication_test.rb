require "test_helper"
require 'date'

describe Publication do
  let(:publication) { Publication.new }
  let(:sailor_moon) { publications(:sailormoon) }

  describe 'publication validity' do
    it 'must be valid' do
      sailor_moon.valid?.must_equal true
    end
    it 'requires a title and category' do
      sailor_stars = publications(:sailorstars)

      sailor_moon.title = nil
      sailor_stars.category = nil

      sailor_moon.valid?.must_equal false
      sailor_stars.valid?.must_equal false
    end
    it 'wont a take an empty string for a title' do
      sailor_moon.title = ""

      sailor_moon.valid?.must_equal false
    end
    it 'wont make a duplicate record' do
      duplicate_moon = Publication.new(category: "Book", title: "Sailor Moon", creator: "Naoko Takeuchi")

      duplicate_moon.valid?.must_equal false
    end
  end

  describe 'publication relationships' do
    it 'can have zero or more votes' do
      #zero votes
      publications(:sailorcrystal).votes.must_be_empty

      #multiple votes
      sailor_moon.votes.must_include votes(:vote32)
      sailor_moon.votes.length.must_equal 6
    end
  end

  describe 'custom methods' do
    describe 'self.find_spotlight_publication' do
      it 'returns the publication record with the most votes' do
        Publication.find_spotlight_publication.must_equal publications(:cardcaptor)
      end

      it 'returns record with most recent vote if there is a tie' do
        new_vote_1 = Vote.create(user: users(:sailorj), publication: sailor_moon)
        new_vote_2 = Vote.create(user: users(:sailorn), publication: sailor_moon)
        new_vote_3 = Vote.create(user: users(:sailorp), publication: sailor_moon)
        new_vote_4 = Vote.create(user: users(:sailoru), publication: sailor_moon)

        Publication.find_spotlight_publication.must_equal sailor_moon
      end

      it 'returns nil if there are no votes yet' do
        Publication.all.each do |publication|
          publication.votes.each do | vote |
            vote.destroy
          end
        end
        Publication.find_spotlight_publication.must_be_nil
      end
    end
    describe 'self.return_all_categories' do
    end
    describe 'self.find_top_ten_by' do
    end
    describe 'find_total_votes' do
    end
  end
end
