class Addvotecounttoart < ActiveRecord::Migration[5.1]
  def change
    add_column :arts, :vote_count, :integer
  end
end
