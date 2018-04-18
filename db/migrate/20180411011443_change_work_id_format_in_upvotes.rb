class ChangeWorkIdFormatInUpvotes < ActiveRecord::Migration[5.1]
  def change
    change_column :upvotes, :work_id, :integer
  end
end
