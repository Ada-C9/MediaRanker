class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :work_title
      t.string :work_creator
      t.string :work_description
      t.string :work_category
      t.integer :work_publication_year

      t.timestamps
    end
  end
end
