class WorksPublicationYearChangeToString < ActiveRecord::Migration[5.1]
  def change
     change_column :works, :publication_year, :string
  end
end
