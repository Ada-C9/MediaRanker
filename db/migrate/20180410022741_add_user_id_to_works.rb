class AddUserIdToWorks < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :user, foreign_key: true
  end
end
