class CreateSubreddits < ActiveRecord::Migration[5.1]
  def change
    create_table :subreddits do |t|
      t.string :title
      t.string :description
      t.integer :subscribers

      t.timestamps
    end
  end
end
