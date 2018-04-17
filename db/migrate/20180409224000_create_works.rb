class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :created_by
      t.date :publication_date
      t.string :description

      t.timestamps
    end
  end
end
