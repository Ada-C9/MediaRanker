class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :creator
      t.integer :publication_year
      t.string :description

      t.timestamps
    end
  end
end
