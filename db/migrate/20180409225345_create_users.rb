class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :date_joined
      t.boolean :logged_in

      t.timestamps
    end
  end
end
