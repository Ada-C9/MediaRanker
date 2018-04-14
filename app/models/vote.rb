class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  validates :user_id, numericality: { only_integer: true}
  validates :publication_id, numericality: { only_integer: true}

  def find_publication
    Publication.find_by(id: self.publication_id)
  end

end
