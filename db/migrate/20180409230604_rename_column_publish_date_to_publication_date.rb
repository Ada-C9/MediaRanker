class RenameColumnPublishDateToPublicationDate < ActiveRecord::Migration[5.1]
  def change
    rename_column :works, :publish_date, :publication_date
  end
end
