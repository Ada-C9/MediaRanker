class Vote < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :publication, counter_cache: true

  validates :user_id, numericality: { only_integer: true}
  validates :publication_id, numericality: { only_integer: true}

  def find_publication
    publication = Publication.find_by(id: self.publication_id)
  end
end
