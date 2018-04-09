require "test_helper"

describe Subreddit do
  let(:subreddit) { Subreddit.new }

  it "must be valid" do
    value(subreddit).must_be :valid?
  end
end
