class CreateArts < ActiveRecord::Migration[5.1]
  def change
    create_table :arts do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.string :pub_year
      t.string :description

      t.timestamps
    end
  end
end
