class Work < ApplicationRecord
  # relationships
  has_many :votes
  # validations
  # validates {:title, presence: true, :created_by, presence: true, :publication_date, presence: true, :category, presence: true}

  TOP_MEDIA = [0..10]

  def all_albums
    return Work.where(category: "album")
  end

  def all_movies
  end 
  # movies = works.where.not(category: nil)
  # movies = movies.order(category: :asc)

  # def self.top_movies
  #   top_movies = []
  #
  #   until top_movies.length == TOP_MEDIA
  #     works.each do |work|
  #       if work.category == 'album'
  #         top_movies << work
  #       end
  #     end
  #   end
  #
  #   return top_movies
  # end
  #
  # def top_books
  #   top_books = []
  #
  #   until top_books.length == TOP_MEDIA
  #     works.each do |work|
  #       if work.category == 'book'
  #         top_books << work
  #       end
  #     end
  #   end
  #
  #   return top_books
  # end

  # def inspect
  #   "#<#{self.class.name}:0x#{self.object_id.to_s(16)}>"
  # end

end
