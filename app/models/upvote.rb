class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates_uniqueness_of :user_id, scope: :work_id

  def self.tallied
    ordered_hash = Upvote.group(:work_id).count
    return ordered_hash
  end

  def self.top
    hash = Upvote.tallied
    chosen = hash.select {|k,v| v == hash.values.max }.keys.first
    return chosen
  end

  def self.featured_work
    id = Upvote.top
    featured = Work.find_by(id: id)
    return featured
  end
end
