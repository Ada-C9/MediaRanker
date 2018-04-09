require "test_helper"

describe WelcomesController do
  it "should get index" do
    get welcomes_index_url
    value(response).must_be :success?
  end

end
