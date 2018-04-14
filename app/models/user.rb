class User < ApplicationRecord
  has_many :upvotes
  validates :username, presence: true, length: { in: 1..250 }, :uniqueness => true

  def get_all_users
    return find_all_users
  end

  def get_votes_given
    return find_votes_given
  end

  private

  def find_all_users
    return self.users
  end

  def find_votes_given
    return self.upvotes
  end

end
