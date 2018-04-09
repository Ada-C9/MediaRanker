class CreateWorksCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :works_categories do |t|
      t.belongs_to :work, index: true
      t.belongs_to :category, index: true

    end
  end
end
