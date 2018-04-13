class AddTwitteridToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :twitter_id, :integer
  end
end
