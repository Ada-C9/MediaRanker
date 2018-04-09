class AddDescriptionChangeDate < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :description, :string
    remove_column :works, :published
    add_column :works, :publication_year, :integer
  end
end
