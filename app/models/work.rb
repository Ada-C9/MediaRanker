class Work < ApplicationRecord
  has_many :upvotes
  validates :work_title, presence: true #uniqueness
  validates :work_creator, presence: true
  validates :work_category, presence: true

  def get_upvotes_received
    return find_upvotes_received
  end

  def get_upvotes_count
    return count_upvotes_received
  end

  def self.by_category
    self.order(vote_count: :desc)
  end


  private


  def find_upvotes_received
    return self.upvotes
  end

  def count_upvotes_received
    return self.upvotes.count
  end


end
