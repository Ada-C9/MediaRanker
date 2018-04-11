class Work < ApplicationRecord
    has_many :upvotes
  validates :work_title, presence: true #uniqueness
  validates :work_creator, presence: true
  validates :work_category, presence: true

  def get_all_works
    return find_all_works
  end

  def return_top_movies
    return find_top_movies
  end

  def return_top_books
    return find_top_books
  end

  def return_top_albums
    return find_top_albums
  end

  def return_votes_received
    return find_votes_received
  end

  private

  def find_all_works
    return self.works
  end

  def find_top_movies
    return self.works.where(work_category: movie)
  end

  def find_top_books
    return self.works.where(work_category: book)
  end

  def find_top_albums
    return self.works.where(work_category: album)
  end

  def find_votes_received
    return self.upvotes
  end

end
