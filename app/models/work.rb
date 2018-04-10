
class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  def self.make_category_hash
    categories = []
    i = 0
    while i < Work.all.length
      if categories.include?(Work.all[i].category) == false
        categories << Work.all[i].category
      end
      i += 1
    end
    return categories
  end

  def self.num_runs(array)
    runs = 0
    array.length > 10 ? runs = 10 : runs = array.length
    return runs
  end

  def self.spotlight

  end
end
