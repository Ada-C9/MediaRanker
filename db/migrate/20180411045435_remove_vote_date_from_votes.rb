class RemoveVoteDateFromVotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :votes, :vote_date
  end
end
