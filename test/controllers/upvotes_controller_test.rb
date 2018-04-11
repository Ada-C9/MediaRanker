require "test_helper"

describe UpvotesController do
  it "should get index" do
    get upvotes_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get upvotes_show_url
    value(response).must_be :success?
  end

  it "should get new" do
    get upvotes_new_url
    value(response).must_be :success?
  end

  it "should get create" do
    get upvotes_create_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get upvotes_edit_url
    value(response).must_be :success?
  end

  it "should get update" do
    get upvotes_update_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get upvotes_destroy_url
    value(response).must_be :success?
  end

end
