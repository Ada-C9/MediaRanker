class AddVoteCountToWork < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :vote_count, :integer
  end
end
