class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.string :work_id
      t.integer :user_id
      t.belongs_to :work, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
