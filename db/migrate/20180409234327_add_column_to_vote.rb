class AddColumnToVote < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :user, foreign_key: true
<<<<<<< HEAD
    add_reference :votes, :work, foreign_key: true
=======
    add_reference :votes, :work, foreign_key: true  
>>>>>>> master
  end
end
