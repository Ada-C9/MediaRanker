class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :name
      t.string :title
      t.string :category
      t.string :creator
      t.string :publication_year
      t.text :description

      t.timestamps
    end
  end
end
