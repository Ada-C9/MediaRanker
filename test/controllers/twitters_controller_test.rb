require "test_helper"

describe TwittersController do
  it "should get index" do
    get twitters_index_url
    value(response).must_be :success?
  end

end
