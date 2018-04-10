class Work < ApplicationRecord
  # relationships
  has_and_belongs_to_many :votes
  # validations

  # business logic
  TOP_MEDIA = 10

  # where loop thru collection of works?

  def top_movies
    top_movies = []

    until top_movies.length == TOP_MEDIA
      works.each do |work|
        if work.category == 'movie'
          top_movies << work
        end
      end
    end

    return top_movies
  end

  def top_albums
    top_albums = []

    until top_movies.length == TOP_MEDIA
      works.each do |work|
        if work.category == 'album'
          top_albums << work
        end
      end
    end

    return top_albums
  end

  def top_books
    top_books = []

    until top_books.length == TOP_MEDIA
      works.each do |work|
        if work.category == 'book'
          top_books << work
        end
      end
    end

    return top_books
  end

  # def inspect
  #   "#<#{self.class.name}:0x#{self.object_id.to_s(16)}>"
  # end

end
