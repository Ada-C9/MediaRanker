class AddSubredditidToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :subreddit_id, :integer
  end
end
