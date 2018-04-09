require "test_helper"

describe MainsController do
  it "should get index" do
    get mains_index_url
    value(response).must_be :success?
  end

end
