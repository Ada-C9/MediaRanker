class ChangeWorkTotalVotesToVotes < ActiveRecord::Migration[5.1]
  def change
    rename_column :works, :total_votes, :votes
  end
end
