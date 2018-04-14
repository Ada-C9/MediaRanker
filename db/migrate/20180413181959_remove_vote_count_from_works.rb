class RemoveVoteCountFromWorks < ActiveRecord::Migration[5.1]
  def change
    remove_column :works, :vote_count
  end
end
