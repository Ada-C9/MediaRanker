class AddForeignKeysToVotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :work, index: true
    add_reference :votes, :user, index: true
    add_foreign_key :votes, :works
    add_foreign_key :votes, :users
  end
end
