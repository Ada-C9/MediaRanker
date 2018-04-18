class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.date :vote_date

      t.timestamps
    end
  end
end
