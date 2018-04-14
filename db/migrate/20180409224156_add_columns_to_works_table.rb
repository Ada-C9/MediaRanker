class AddColumnsToWorksTable < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :title, :string
    add_column :works, :category, :string
    add_column :works, :published_year, :string
    add_column :works, :description, :string
    add_column :works, :created_by, :string
  end
end
