require "test_helper"

describe SubredditsController do
  it "should get index" do
    get subreddits_index_url
    value(response).must_be :success?
  end

end
