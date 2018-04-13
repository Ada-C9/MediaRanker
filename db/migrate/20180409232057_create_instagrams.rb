class CreateInstagrams < ActiveRecord::Migration[5.1]
  def change
    create_table :instagrams do |t|
      t.string :handle
      t.integer :posts
      t.integer :followers

      t.timestamps
    end
  end
end
