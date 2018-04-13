require "test_helper"

describe Work do
  let(:work) { Work.new }
  let(:book) {works(:hp)}
  let(:album) {works(:imagine)}
  let(:movie) {works(:coco)}

  it "has validation for empty parameters" do
    work.valid?.must_equal false
  end

  it "has validation for empty title" do
    book.title = nil
    book.valid?.must_equal false
    book.errors.messages.must_include :title
    book.title = ""
    book.valid?.must_equal false
    book.errors.messages.must_include :title

    album.title = nil
    album.valid?.must_equal false
    album.errors.messages.must_include :title
    album.title = ""
    album.valid?.must_equal false
    album.errors.messages.must_include :title

    movie.title = nil
    movie.valid?.must_equal false
    movie.errors.messages.must_include :title
    movie.title = ""
    movie.valid?.must_equal false
    movie.errors.messages.must_include :title
  end

  it "has validation for uniqueness but only scoped to category" do
    book1 = Work.create({ category: "book", title: "The Alchemist", creator: "Paulo Coelho", publication_year: 1988, description: "A fable about destiny"})
    book1.valid?.must_equal true

    book2 = Work.create({ category: "book", title: "The Alchemist", creator: "Paulo Coelho", publication_year: 1988, description: "A fable about destiny"})
    book2.valid?.must_equal false

    movie1 = Work.create({ category: "movie", title: "The Alchemist", creator: "Paulo Coelho", publication_year: 1988, description: "A fable about destiny"})
    movie1.valid?.must_equal true

  end

  it "has validation for empty category" do
    book.category = nil
    book.valid?.must_equal false
    book.errors.messages.must_include :category
    book.category = ""
    book.valid?.must_equal false
    book.errors.messages.must_include :category

    album.category = nil
    album.valid?.must_equal false
    album.errors.messages.must_include :category
    album.category = ""
    album.valid?.must_equal false
    album.errors.messages.must_include :category

    movie.category = nil
    movie.valid?.must_equal false
    movie.errors.messages.must_include :category
    movie.category = ""
    movie.valid?.must_equal false
    movie.errors.messages.must_include :category
  end

  it "has validation for empty publication year" do
    book.publication_year = nil
    book.valid?.must_equal false
    book.errors.messages.must_include :publication_year
    book.publication_year = ""
    book.valid?.must_equal false
    book.errors.messages.must_include :publication_year

    album.publication_year = nil
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year
    album.publication_year = ""
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year

    movie.publication_year = nil
    movie.valid?.must_equal false
    movie.errors.messages.must_include :publication_year
    movie.publication_year = ""
    movie.valid?.must_equal false
    movie.errors.messages.must_include :publication_year
  end

  it "checks publication year length is four" do
    book.publication_year = 234
    book.valid?.must_equal false
    book.errors.messages.must_include :publication_year
    book.publication_year = 23456
    book.valid?.must_equal false
    book.errors.messages.must_include :publication_year

    album.publication_year = 22
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year
    album.publication_year = 1
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year

    movie.publication_year = 0
    movie.valid?.must_equal false
    movie.errors.messages.must_include :publication_year
    movie.publication_year = 0234
    movie.valid?.must_equal false
    movie.errors.messages.must_include :publication_year
  end

  it "checks publication year is integer" do
    book.publication_year = "1300AD"
    book.valid?.must_equal false
    book.errors.messages.must_include :publication_year
    book.publication_year = "ninty"
    book.valid?.must_equal false
    book.errors.messages.must_include :publication_year

    album.publication_year = -1986
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year
    album.publication_year = "one"
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year

    movie.publication_year = "!@@#"
    movie.valid?.must_equal false
    movie.errors.messages.must_include :publication_year
    movie.publication_year = 23_1
    movie.valid?.must_equal false
    movie.errors.messages.must_include :publication_year
  end

  it "checks publication year must be in past" do
    album.publication_year = 2019
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year
    album.publication_year = 2050
    album.valid?.must_equal false
    album.errors.messages.must_include :publication_year
  end


  it "has validation for empty creator" do
    book.creator = nil
    book.valid?.must_equal false
    book.errors.messages.must_include :creator
    book.creator = ""
    book.valid?.must_equal false
    book.errors.messages.must_include :creator

    album.creator = nil
    album.valid?.must_equal false
    album.errors.messages.must_include :creator
    album.creator = ""
    album.valid?.must_equal false
    album.errors.messages.must_include :creator

    movie.creator = nil
    movie.valid?.must_equal false
    movie.errors.messages.must_include :creator
    movie.creator = ""
    movie.valid?.must_equal false
    movie.errors.messages.must_include :creator
  end

  it "checks description can be max 500" do
    book.description = (0...505).map { ('a'..'z').to_a[rand(26)] }.join
    book.valid?.must_equal false
  end

  it "returns true if valid" do
    book.valid?.must_equal true
    album.valid?.must_equal true
    movie.valid?.must_equal true
  end

  it "has relations" do
    book.upvotes[0].id.must_equal upvotes(:one_up).id
    book.upvotes.count.must_equal 3
  end

  it "Work#top must return top works upvoted in category " do
    Work.top(10, "book").count.must_equal 1
    Work.top(10, "album").count.must_equal 1
    Work.top(10, "movie").count.must_equal 1
    Work.top(10).count.must_equal 3
    Work.top(1)[0].must_equal book
  end

  it "Work#upvotes_count must return upvote count"  do
    work.upvotes_count.must_equal 0
    book.upvotes_count.must_equal 3
  end



end
