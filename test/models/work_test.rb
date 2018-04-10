require "test_helper"

describe Work do
  let(:boosh) {works(:boosh)}
  let(:work) {Work.new}

  it "must have a title and category" do
    boosh.valid?.must_equal true
  end

  it "will not be true without title and category" do
    boosh.title = nil
    boosh.valid?.must_equal false;

    boosh.title = "Mighty Boosh"
    boosh.category = nil
    boosh.valid?.must_equal false;
  end

  it "will not be valid with the same title and category" do
    work.title = "Mighty Boosh"
    work.category = "movie"
    work.valid?.must_equal false
  end

  it "will be valid with unique title or same title with a different" do
    work.title = "Mighty Boosh"
    work.category = "album"
    work.valid?.must_equal true
    boosh.valid?.must_equal true
  end

end
