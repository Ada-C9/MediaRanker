
class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  def self.make_category_hash
    category_hash = {}
    i = 0
    while i < Work.all.length
      if category_hash.has_key?(Work.all[i].category) == false
        category_hash[Work.all[i].category] = []
        category_hash[Work.all[i].category] << Work.all[i]
      else
        category_hash[Work.all[i].category] << Work.all[i]
      end
      i += 1
    end

    return category_hash
  end
end
