module HomeHelper

  def top_movies
    Work.where(category: "movie")
  end

  def top_books
  end

  def top_albums
  end

end
