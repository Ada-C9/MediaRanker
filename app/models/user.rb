class User < ApplicationRecord
  has_many :upvotes

  validates :name, presence: true, uniqueness: true, length: { minimum: 2}

  def upvotes_count
    return upvotes.count
  end
  
end
