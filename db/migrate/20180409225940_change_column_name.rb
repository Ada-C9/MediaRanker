class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :works, :type, :category
    rename_column :works, :name, :title
  end
end
