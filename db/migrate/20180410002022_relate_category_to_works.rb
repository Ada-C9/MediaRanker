class RelateCategoryToWorks < ActiveRecord::Migration[5.1]
  def change
    add_reference :works, :category, foreign_key: true
  end
end
