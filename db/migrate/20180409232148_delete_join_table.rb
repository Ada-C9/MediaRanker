class DeleteJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:works_votes)
  end
end
