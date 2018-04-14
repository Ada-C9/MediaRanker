class RemoveJoinedFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :joined, :date
  end
end
