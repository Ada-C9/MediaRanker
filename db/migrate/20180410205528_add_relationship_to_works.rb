class AddRelationshipToWorks < ActiveRecord::Migration[5.1]
  def change
    add_reference :works, :vote, foreign_key: true
  end
end
