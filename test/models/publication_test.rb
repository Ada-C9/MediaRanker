require "test_helper"

describe Publication do
  let(:publication) { Publication.new }

  describe 'publication' do
    it "has a creator" do
      publication = publications(:reader)
      publication.creator.must_equal "writer"
    end

    it "has a valid year" do
      publication = publications(:reader)
      publication.publication_year.must_equal 1991
    end

    it "does not accept years that are too short" do
      publication = Publication.new(publication_year: 123)
      publication.valid?.must_equal false
      publication.errors.must_include :publication_year
    end

    it "does not accept years that are too long" do
      publication = Publication.new(publication_year: 12344)
      publication.valid?.must_equal false
      publication.errors.must_include :publication_year
    end
  end
end
