class Remove < ActiveRecord::Migration[5.1]
  def change
    remove_column(:votes, :vote_tracking)
  end
end
