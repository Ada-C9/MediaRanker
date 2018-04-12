require "test_helper"

describe Work do
  let(:work) { Work.new(category: "album", title: "Are You Experienced", creator: "The Jimi Hendrix Experience", publication_year: 1967) }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must not be valid when category is not selected" do
    
  end
end
