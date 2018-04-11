require "test_helper"

describe Publication do

  describe 'publication' do

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

    it "requires title" do
      publication = Publication.new(title: "")
      publication.valid?.must_equal false
      publication.errors.must_include :title
    end

    it "does not accept a too short title" do
      publication = Publication.new(title:"whateverwhateverwhateverwhateverwhatever")
      publication.valid?.must_equal false
      publication.errors.must_include :title
    end

    it "does not accept a too long title" do
      publication = Publication.new
      publication.valid?.must_equal false
      publication.errors.must_include :title
    end

    it "requires creator" do
      publication = Publication.new
      publication.valid?.must_equal false
      publication.errors.must_include :creator
    end

    it "requires publication year" do
      publication = Publication.new
      publication.valid?.must_equal false
      publication.errors.must_include :publication_year
    end

    it "does not accept a too short creator" do
      publication = Publication.new(creator:"whateverwhateverwhateverwhateverwhatever")
      publication.valid?.must_equal false
      publication.errors.must_include :creator
    end

    it "does not accept a too long creator" do
      publication = Publication.new(creator: "")
      publication.valid?.must_equal false
      publication.errors.must_include :creator
    end
  end
end
