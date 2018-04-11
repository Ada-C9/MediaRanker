class SetVoteCountToZero < ActiveRecord::Migration[5.1]
  def change
    remove_column :works, :vote_count
    add_column :works, :vote_count, :integer, default: 0
  end
end
