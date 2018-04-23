class ChangeColumnNameFormatToCategory < ActiveRecord::Migration[5.1]
  def change
    rename_column :works, :format, :category
  end
end
