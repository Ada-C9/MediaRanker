require "test_helper"

describe PublicationsController do
  it "should get index" do
    get publications_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get publications_show_url
    value(response).must_be :success?
  end

  it "should get create" do
    get publications_create_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get publications_destroy_url
    value(response).must_be :success?
  end

  it "should get new" do
    get publications_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get publications_edit_url
    value(response).must_be :success?
  end

  it "should get update" do
    get publications_update_url
    value(response).must_be :success?
  end

end
