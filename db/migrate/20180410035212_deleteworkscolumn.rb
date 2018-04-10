class Deleteworkscolumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :works, :descrpition
  end
end
