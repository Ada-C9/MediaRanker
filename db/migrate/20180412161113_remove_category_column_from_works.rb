class RemoveCategoryColumnFromWorks < ActiveRecord::Migration[5.1]
  def change
    remove_column(:works, :category)
  end
end
