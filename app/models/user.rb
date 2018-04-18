class User < ApplicationRecord
  has_many :upvotes

  validates :username, presence: true, uniqueness: true, length: { minimum: 1}

  def get_count
    return upvotes.count
  end

  def self.get_username(input)
    @logged = User.find_by(id: input)
    return @logged.username if @logged
  end

end
