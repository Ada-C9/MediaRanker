class RemoveVoteColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :works, :votes
  end
end
