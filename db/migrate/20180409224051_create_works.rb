class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.string :year_released
      t.timestamps
    end
  end
end
