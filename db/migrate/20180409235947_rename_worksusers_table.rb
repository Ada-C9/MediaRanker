class RenameWorksusersTable < ActiveRecord::Migration[5.1]
  def change
    rename_table(:works_users_joins, :votes)
  end
end
