class DropWorksUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :users_works
  end
end
