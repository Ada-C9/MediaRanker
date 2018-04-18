class AddWorksVoteCounter < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :votes, :integer
  end
end
