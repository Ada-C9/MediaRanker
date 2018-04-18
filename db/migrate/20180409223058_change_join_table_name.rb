class ChangeJoinTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :works_users_join, :users_works
  end
end
