
class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  def self.make_category_hash
    category_hash = Hash.new
    i = 0
    while i < Work.all.length
      if category_hash.has_key?(Work.all[i].category) == false
        category_hash[Work.all[i].category] = []
        category_hash[Work.all[i].category] << Work.all[i]
      # elsif category_hash.has_key?(Work.all[i].category) && category_hash[Work.all[i].category].length < 10
      else
        category_hash[Work.all[i].category] << Work.all[i]
      end
      i += 1
    end
    return category_hash
  end

  def self.num_runs(array)
    runs = 0
    hash = Work.make_category_hash
    array.length > 10 ? runs = 10 : runs = array.length
    return runs
  end

  def self.spotlight

  end
end
