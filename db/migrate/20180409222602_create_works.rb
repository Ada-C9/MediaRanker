class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :name
      t.string :created_by
      t.integer :published
      t.string :type
      t.integer :votes

      t.timestamps
    end
  end
end
