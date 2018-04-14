require "test_helper"
require 'pry'
describe Publication do

  describe 'publication' do

    it "does not accept years that are too short" do
      publication = publications(:tunes)
      publication.publication_year = 123
      publication.valid?.must_equal false
      publication.errors.must_include :publication_year
    end

    it "does not accept years that are too long" do
      publication = publications(:tunes)
      publication.publication_year = 12345
      publication.valid?.must_equal false
      publication.errors.must_include :publication_year
    end

    it "requires title" do
      publication = publications(:reader)
      publication.title = nil
      publication.valid?.must_equal false
      publication.errors.must_include :title
    end

    it "does not accept a too short title" do
      publication = publications(:tunes)
      publication.title = ""
      publication.valid?.must_equal false
      publication.errors.must_include :title
    end

    it "does not accept a too long title" do
      publication = publications(:watcher)
      publication.title = "whateverwhateverwhateverwhateverwhatever"
      publication.valid?.must_equal false
      publication.errors.must_include :title
    end

    it "requires creator" do
      publication = publications(:reader)
      publication.creator = nil
      publication.valid?.must_equal false
      publication.errors.must_include :creator
    end

    it "requires publication year" do
      publication = publications(:watcher)
      publication.publication_year = nil
      publication.valid?.must_equal false
      publication.errors.must_include :publication_year
    end

    it "does not accept a too long creator" do
      publication = publications(:listener)
      publication.creator = "whateverwhateverwhateverwhateverwhatever"
      publication.valid?.must_equal false
      publication.errors.must_include :creator
    end

    it "does not accept a too short creator" do
      publication = publications(:tunes)
      publication.creator = ""
      publication.valid?.must_equal false
      publication.errors.must_include :creator
    end
  end

  describe 'self.find_votes' do
    it "returns count of votes for publication" do
      publication = publications(:listener)
      Vote.new(publication_id: publication.id)
      Vote.new(publication_id: publication.id)
      number_votes = Publication.find_votes(publication.category)
      number_votes.length.must_equal 2
    end
  end

end
