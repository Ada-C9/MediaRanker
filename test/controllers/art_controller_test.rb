require "test_helper"

describe ArtController do
  it "should get index" do
    get art_index_url
    value(response).must_be :success?
  end

end
