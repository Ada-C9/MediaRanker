require "test_helper"

describe Work do


  it "must be valid" do
    hp = works(:harry_potter)
    value(hp).must_be :valid?
  end

  it "must have a collection of votes" do
    works(:revolver).votes.must_equal []
    vote = Vote.new
    works(:revolver).votes << vote
    works(:revolver).votes.must_equal [vote]
  end

  it "must have a title" do
    work = Work.create(category: 'book', title: nil)
    work.valid?.must_equal false
    work.errors.must_include :title
  end

  it "must have a category" do
    work = Work.create(title: "work")
    work.valid?.must_equal false
    work.errors.must_include :category
  end

  it "must have a numerical publication_year" do
    work = Work.create(category: 'book', title: 'work', publication_year: 'jkadsnf')
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

  describe 'self.top_ten_books' do
    it "must "
  end
  end

end
