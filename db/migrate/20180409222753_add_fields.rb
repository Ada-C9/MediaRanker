class AddFields < ActiveRecord::Migration[5.1]
  def change
    add_column  :works, :category, :string
    change_column :works, :description, :text
  end
end
