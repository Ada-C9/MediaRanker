require "test_helper"

describe VoteController do
  it "should get index" do
    get vote_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get vote_new_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get vote_destroy_url
    value(response).must_be :success?
  end

  it "should get create" do
    get vote_create_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get vote_edit_url
    value(response).must_be :success?
  end

  it "should get update" do
    get vote_update_url
    value(response).must_be :success?
  end

end
