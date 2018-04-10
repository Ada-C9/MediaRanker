class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :creator
      t.int :publication_year
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
