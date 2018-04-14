class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :category
      t.string :creator

      t.timestamps
    end
  end
end
