require "test_helper"

describe WorksController do
  it "should get index" do
    get works_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get new_work_url
    value(response).must_be :success?
  end

  it "should get show" do
    get work_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get edit_work_url
    value(response).must_be :success?
  end

end
