class AddPublicationYearToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :publication_year, :integer
  end
end
