class AddTotalVotesToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :total_votes, :integer
  end
end
