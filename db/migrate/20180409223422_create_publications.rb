class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.integer :publication_year
      t.string :description

      t.timestamps
    end
  end
end
