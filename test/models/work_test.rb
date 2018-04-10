require "test_helper"

describe Work do
  let(:work) { Work.new }
  let(:book) {works(:hp)}
  let(:album) {works(:imagine)}
  let(:movie) {works(:coco)}

  it "has validation for empty parameters" do
    work.valid?.must_equal false
  end
  it "returns true if valid?" do
    book.valid?.must_equal true
    album.valid?.must_equal true
    book.valid?.must_equal true
  end

end
