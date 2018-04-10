require "test_helper"

describe WorksController do
  it "should get index" do
    get works_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get works_new_url
    value(response).must_be :success?
  end

  it "should get create" do
    get works_create_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get works_edit_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get works_destroy_url
    value(response).must_be :success?
  end

end
