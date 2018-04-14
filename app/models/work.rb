class Work < ApplicationRecord
  has_many :votes

  def vote_count
    self.votes.where(work_id: self.id).count
  end

  def self.top_overall
    works = Work.all
    top_work = works.max_by {|work| work.vote_count}
  end

  def self.top(type)
    works = Work.where(category: type)
    sorted_works = works.sort_by {|work| -work.vote_count}
  end

  def sorted_descending
    sorted_albums = @albums.sort_by {|album| -album.vote_count}
  end
end
