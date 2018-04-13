require "test_helper"

describe InstagramsController do
  it "should get index" do
    get instagrams_index_url
    value(response).must_be :success?
  end

end
