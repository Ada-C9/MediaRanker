class RemoveVotedDateFromVotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :votes, :voted_date, :datetime
  end
end
