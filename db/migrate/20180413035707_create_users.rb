class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :join_date
      t.string :summary

      t.timestamps
    end
  end
end
