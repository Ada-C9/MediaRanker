class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :art_id
      t.references :user, foreign_key: true
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
