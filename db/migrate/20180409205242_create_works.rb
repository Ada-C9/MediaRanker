class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :format
      t.string :title
      t.date :published

      t.timestamps
    end
  end
end
