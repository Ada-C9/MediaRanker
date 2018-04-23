class RemoveCreatedOnVotesModel < ActiveRecord::Migration[5.1]
  def change
    remove_column :votes, :created
  end
end
