class AddJoinedDateColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :joined, :date
    add_column :votes, :date, :date
  end
end
