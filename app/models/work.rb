class Work < ApplicationRecord
  has_many :votes

  validates_presence_of :title, :category

  # validates :title, uniqueness: { scope: :category, message: "Cannot have the same title within the same media type" }

  def vote_count
    self.votes.where(work_id: self.id).count
  end

end
