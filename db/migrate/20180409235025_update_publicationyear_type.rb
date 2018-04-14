class UpdatePublicationyearType < ActiveRecord::Migration[5.1]
  def change
    remove_column :works, :publication_year
  end
end
