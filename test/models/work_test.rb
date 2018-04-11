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
    book.title = ""
    book.valid?.must_equal false

    album.title = nil
    album.valid?.must_equal false
    album.title = ""
    album.valid?.must_equal false

    movie.title = nil
    movie.valid?.must_equal false
    movie.title = ""
    movie.valid?.must_equal false
  end

  it "has validation for empty category" do
    book.category = nil
    book.valid?.must_equal false
    book.category = ""
    book.valid?.must_equal false

    album.category = nil
    album.valid?.must_equal false
    album.category = ""
    album.valid?.must_equal false

    movie.category = nil
    movie.valid?.must_equal false
    movie.category = ""
    movie.valid?.must_equal false
  end

  it "has validation for empty publication year" do
    book.publication_year = nil
    book.valid?.must_equal false
    book.publication_year = ""
    book.valid?.must_equal false

    album.publication_year = nil
    album.valid?.must_equal false
    album.publication_year = ""
    album.valid?.must_equal false

    movie.publication_year = nil
    movie.valid?.must_equal false
    movie.publication_year = ""
    movie.valid?.must_equal false
  end

  it "checks publication year length is four" do
    book.publication_year = 234
    book.valid?.must_equal false
    book.publication_year = 23456
    book.valid?.must_equal false

    album.publication_year = 22
    album.valid?.must_equal false
    album.publication_year = 1
    album.valid?.must_equal false

    movie.publication_year = 0
    movie.valid?.must_equal false
    movie.publication_year = 0234
    movie.valid?.must_equal false
  end

  it "checks publication year is integer" do
    book.publication_year = "1300AD"
    book.valid?.must_equal false
    book.publication_year = "ninty"
    book.valid?.must_equal false

    album.publication_year = -1986
    album.valid?.must_equal false
    album.publication_year = "one"
    album.valid?.must_equal false

    movie.publication_year = "!@@#"
    movie.valid?.must_equal false
    movie.publication_year = 23_1
    movie.valid?.must_equal false
  end


  it "has validation for empty creator" do
    book.creator = nil
    book.valid?.must_equal false
    book.creator = ""
    book.valid?.must_equal false

    album.creator = nil
    album.valid?.must_equal false
    album.creator = ""
    album.valid?.must_equal false

    movie.creator = nil
    movie.valid?.must_equal false
    movie.creator = ""
    movie.valid?.must_equal false
  end

  it "returns true if valid" do
    book.valid?.must_equal true
    album.valid?.must_equal true
    movie.valid?.must_equal true
  end



end
