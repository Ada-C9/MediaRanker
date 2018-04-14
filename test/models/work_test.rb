require "test_helper"

describe Work do
  it "must be valid" do
    hp = works(:harry_potter)
    value(hp).must_be :valid?
  end

  it "must have a collection of votes" do
    works(:rubber_soul).votes.must_equal []
    vote = Vote.new
    works(:rubber_soul).votes << vote
    works(:rubber_soul).votes.must_equal [vote]
  end

  it "must have a title" do
    work = Work.create(category: 'book', title: nil)
    work.valid?.must_equal false
    work.errors.must_include :title
  end

  it "must have a category" do
    work = Work.create(title: "banana")
    work.valid?.must_equal false
    work.errors.must_include :category
  end

  it "must have a numerical publication_year" do
    work = Work.create(category: 'book', title: 'work', publication_year: 'jkkjn23')
    work.valid?.must_equal false
    work.errors.must_include :publication_year
  end

  it "must have a 4 digit publication_year" do
    work = Work.create(category: 'book', title: 'work', publication_year: 23)
    work.valid?.must_equal false
    work.errors.must_include :publication_year

    work = Work.create(category: 'book', title: 'work', publication_year: 1999)
    work.valid?.must_equal true
  end
end

describe "self methods" do
  it "must return an array of works of the same category" do
    books = Work.books
    books.each do |work|
      work.category.must_equal "book"
    end
    books.length.must_equal 2

    albums = Work.albums
    albums.each do |work|
      work.category.must_equal "album"
    end
    albums.length.must_equal 1

    movies = Work.movies
    movies.each do |work|
      work.category.must_equal "movie"
    end
    movies.length.must_equal 12
  end

  it "must return array with work with highest number of votes at index 0" do
    books = Work.books
    (books[0].votes.count >= books[1].votes.count).must_equal true

    movies = Work.movies
    (movies[0].votes.count >= movies[1].votes.count).must_equal true
  end

end
