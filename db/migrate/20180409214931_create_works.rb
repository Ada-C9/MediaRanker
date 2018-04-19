class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :created_by
      t.integer :year

      t.timestamps
    end
  end
end
