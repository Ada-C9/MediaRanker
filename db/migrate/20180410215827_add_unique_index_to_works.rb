class AddUniqueIndexToWorks < ActiveRecord::Migration[5.1]
  def change
    add_index :works, [:title, :category], unique: true
  end
end
