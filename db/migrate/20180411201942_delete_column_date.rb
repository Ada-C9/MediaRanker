class DeleteColumnDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :joined
    remove_column :votes, :date 
  end
end
